import 'package:Eutychia/models/new/account_login_data.dart';
import 'package:Eutychia/ui/screens/progress_bar_indicator.dart';
import 'package:Eutychia/ui/screens/project_overview.dart';
import 'package:Eutychia/utils/email_address_validator.dart';
import 'package:Eutychia/viewmodels/login_screen_viewmodel.dart';
import 'package:dartz/dartz.dart' as dartz;
import 'package:flutter/material.dart';

enum _LoginStatus { loginWithToken, loginWithPassword, loggingIn }
typedef _PostCredentialsFunc = void Function(String, String);
typedef _UpdateLoginStatus = void Function(_LoginStatus, {bool passwordFailed});

class LoginScreenWidget extends StatefulWidget {
  static const routeName = '/login';

  final LoginScreenViewModel _loginScreenViewModel;
  LoginScreenWidget(this._loginScreenViewModel);

  @override
  State<StatefulWidget> createState() =>
      _LoginScreenWidgetState(_loginScreenViewModel);
}

class _LoginScreenWidgetState extends State<LoginScreenWidget> {
  final LoginScreenViewModel _loginScreenViewModel;
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  String _emailAddress;
  String _password;
  bool _passwordFailed = false;
  _LoginScreenWidgetState(this._loginScreenViewModel);

  _LoginStatus _loginStatus = _LoginStatus.loginWithPassword;

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case _LoginStatus.loggingIn:
        return _loggingInWithPasswordWidget(_loginScreenViewModel,
            _updateLoginStatus, _emailAddress, _password);
      case _LoginStatus.loginWithPassword:
        return _loginForm(context, _passwordVisible, _passwordFailed,
            _updatePasswordVisibility, _postCredentials, _formKey);
      case _LoginStatus.loginWithToken:
        return _loggingInWithTokenWidget(
            _loginScreenViewModel, _updateLoginStatus);
      default:
        throw Error();
    }
  }

  void _updateLoginStatus(_LoginStatus loginStatus,
      {bool passwordFailed = false}) {
    if (loginStatus != _loginStatus || _passwordFailed != passwordFailed) {
      setState(() {
        _loginStatus = loginStatus;
        _passwordFailed = passwordFailed;
      });
    }
  }

  void _updatePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  void _postCredentials(String emailAddress, String password) {
    _emailAddress = emailAddress;
    _password = password;
    _updateLoginStatus(_LoginStatus.loggingIn);
  }
}

Widget _loggingInWithPasswordWidget(
    LoginScreenViewModel _loginScreenViewModel,
    _UpdateLoginStatus updateLoginStatus,
    String emailAddress,
    String password) {
  return Scaffold(
      appBar: AppBar(title: Text("Automatically logging in")),
      body: FutureBuilder<dartz.Either<dynamic, AccountLoginData>>(
          future: _loginScreenViewModel.performLoginWithPassword(
              emailAddress, password),
          builder: (context,
              AsyncSnapshot<dartz.Either<dynamic, AccountLoginData>> snapshot) {
            if (snapshot.hasData) {
              snapshot.data.fold(
                (l) => loginFailed(true, updateLoginStatus),
                (r) => finalizeLogIn(
                    _loginScreenViewModel, r, context, emailAddress),
              );
            }
            return progressBarIndicator();
          }));
}

Widget _loggingInWithTokenWidget(LoginScreenViewModel _loginScreenViewModel,
    _UpdateLoginStatus updateLoginStatus) {
  if (!_loginScreenViewModel.canLoginWithToken()) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      updateLoginStatus(_LoginStatus.loginWithPassword);
    });
    return progressBarIndicator();
  }

  return Scaffold(
      appBar: AppBar(title: Text("Automatically logging in")),
      body: FutureBuilder<dartz.Either<dynamic, AccountLoginData>>(
          future: _loginScreenViewModel.performLoginWithToken(),
          builder: (context,
              AsyncSnapshot<dartz.Either<dynamic, AccountLoginData>> snapshot) {
            if (snapshot.hasData) {
              snapshot.data.fold(
                (l) => loginFailed(false, updateLoginStatus),
                (r) => finalizeLogIn(_loginScreenViewModel, r, context, ""),
              );
            }
            return progressBarIndicator();
          }));
}

StatefulWidget _loginForm(
    BuildContext context,
    bool passwordVisible,
    bool passwordFailed,
    Function updatePasswordVisibility,
    _PostCredentialsFunc postCredentialsFunc,
    GlobalKey<FormState> formKey) {
  String _emailAddress;
  String _passWord;

  return Scaffold(
      appBar: AppBar(
        title: Text("Please log in"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Text(
              "Please provide login details",
              textDirection: TextDirection.ltr,
            ),
            TextFormField(
              decoration:
                  InputDecoration(labelText: 'Enter your email address'),
              validator: (value) {
                if (!isEmailAddressValid(value)) {
                  return 'Email address is invalid';
                } else {
                  _emailAddress = value;
                  return null;
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Enter your password',
                  suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        updatePasswordVisibility();
                      })),
              obscureText: !passwordVisible,
              validator: (value) {
                _passWord = value;
                return null;
              },
            ),
            Visibility(
              visible: passwordFailed,
              child: Text("Your credentials are incorrect, please try again"),
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  postCredentialsFunc(_emailAddress, _passWord);
                }
              },
              child: Text('Login'),
            )
          ],
        ),
      ));
}

void loginFailed(bool passwordFailed, _UpdateLoginStatus updateLoginStatus) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    updateLoginStatus(_LoginStatus.loginWithPassword,
        passwordFailed: passwordFailed);
  });
}

void finalizeLogIn(LoginScreenViewModel _loginScreenViewModel,
    AccountLoginData loginData, BuildContext context, String emailAddress) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    _loginScreenViewModel.loginSucceeded(loginData, emailAddress);
    Navigator.pushNamedAndRemoveUntil(context, ProjectOverviewWidget.routeName,
        ModalRoute.withName(LoginScreenWidget.routeName));
  });
}
