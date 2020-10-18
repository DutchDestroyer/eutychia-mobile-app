import 'package:flutter/material.dart';

import 'ui/screens/loginscreen.dart';

void main() {
  runApp(new MaterialApp(
      title: "Eutychia",
      home: new LoginScreen(),
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.green,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => Colors.black),
        )),
      )));
}
