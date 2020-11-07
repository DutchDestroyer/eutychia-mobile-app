import 'package:Eutychia/utils/email_address_validator.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Login screen")), body: LoginForm());
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            "Please provide login details",
            textDirection: TextDirection.ltr,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Enter your email address'),
            validator: (value) {
              if (!isEmailAddressValid(value)) {
                return 'Email address is invalid';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: 'Enter your password',
                suffixIcon: IconButton(
                    icon: Icon(_passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    })),
            obscureText: !_passwordVisible,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
                Navigator.pushNamedAndRemoveUntil(
                    context, '/testoverview', ModalRoute.withName('/login'));
              }
            },
            child: Text('Login'),
          )
        ],
      ),
    );
  }
}
