import 'package:Eutychia/models/new/account_login_data.dart';
import 'package:Eutychia/models/new/app_account.dart';
import 'package:Eutychia/utils/email_address_validator.dart';
import 'package:flutter/material.dart';

enum _LoginStatus { loginWithToken, loginWithPassword, loggingIn }
typedef _PostCredentialsFunc = void Function(String, String);
typedef _UpdateLoginStatus = void Function(_LoginStatus, {bool passwordFailed});

class LoginScreen extends StatefulWidget {
  final AppAccount _appAccount;
  LoginScreen(this._appAccount);

  @override
  State<StatefulWidget> createState() => _LoginScreenState(_appAccount);
}

class _LoginScreenState extends State<LoginScreen> {
  final AppAccount _appAccount;
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  String _emailAddress;
  String _password;
  bool _passwordFailed = false;
  _LoginScreenState(this._appAccount);

  _LoginStatus _loginStatus = _LoginStatus.loginWithPassword;

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case _LoginStatus.loggingIn:
        return _logInWithPasswordDisplay(
            _appAccount, _updateLoginStatus, _emailAddress, _password);
      case _LoginStatus.loginWithPassword:
        return _loginForm(context, _passwordVisible, _passwordFailed,
            _updatePasswordVisibility, _postCredentials, _formKey);
      case _LoginStatus.loginWithToken:
        return _logInWithTokenDisplay(_appAccount, _updateLoginStatus);
      default:
        throw Error();
    }
  }

  void _updateLoginStatus(_LoginStatus loginStatus,
      {bool passwordFailed = false}) {
    setState(() {
      _loginStatus = loginStatus;
      _passwordFailed = passwordFailed;
    });
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

Widget _logInWithPasswordDisplay(
    AppAccount appAccount,
    _UpdateLoginStatus updateLoginStatus,
    String emailAddress,
    String password) {
  return Scaffold(
      appBar: AppBar(title: Text("Automatically logging in")),
      body: FutureBuilder<AccountLoginData>(
          future:
              appAccount.loginService.loginWithPassword(emailAddress, password),
          builder: (context, AsyncSnapshot<AccountLoginData> snapshot) {
            if (snapshot.hasData && snapshot.data.isSuccessful) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                appAccount.updateLoginData(snapshot.data);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/testoverview', ModalRoute.withName('/login'));
              });
              return _progressBarIndicator();
            } else if (snapshot.hasData && !snapshot.data.isSuccessful) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                updateLoginStatus(_LoginStatus.loginWithPassword,
                    passwordFailed: true);
              });
              return _progressBarIndicator();
            } else {
              return _progressBarIndicator();
            }
          }));
}

Widget _logInWithTokenDisplay(
    AppAccount appAccount, _UpdateLoginStatus updateLoginStatus) {
  if (!appAccount.loginService.canLoginWithToken()) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      updateLoginStatus(_LoginStatus.loginWithPassword);
    });
    return _progressBarIndicator();
  }

  return Scaffold(
      appBar: AppBar(title: Text("Automatically logging in")),
      body: FutureBuilder<AccountLoginData>(
          future: appAccount.loginService
              .loginWithToken(appAccount.emailAddress, appAccount.refreshToken),
          builder: (context, AsyncSnapshot<AccountLoginData> snapshot) {
            if (snapshot.hasData && snapshot.data.isSuccessful) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                appAccount.updateLoginData(snapshot.data);
                Navigator.pushNamedAndRemoveUntil(
                    context, '/testoverview', ModalRoute.withName('/login'));
              });
              return _progressBarIndicator();
            } else if (snapshot.hasData && !snapshot.data.isSuccessful) {
              // TODO remove invalid token
              WidgetsBinding.instance.addPostFrameCallback((_) {
                updateLoginStatus(_LoginStatus.loginWithPassword);
              });
              return _progressBarIndicator();
            } else {
              return _progressBarIndicator();
            }
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

Widget _progressBarIndicator() {
  return Dialog(
    child: new Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        new CircularProgressIndicator(),
        new Text("Loading"),
      ],
    ),
  );
}
