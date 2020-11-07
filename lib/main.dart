import 'package:flutter/material.dart';

import 'ui/screens/login-screen.dart';

void main() {
  runApp(new MaterialApp(
      title: "Eutychia",
      home: new LoginScreen(),
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.green,
        elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.blue;
            } else if (states.contains(MaterialState.disabled)) {
              return Colors.grey;
            } else {
              return Colors.red;
            }
          }),
        )),
      )));
}
