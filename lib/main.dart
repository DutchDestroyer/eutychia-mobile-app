import 'package:Eutychia/ui/screens/test_overview.dart';
import 'package:Eutychia/ui/screens/tests/display_factory.dart';
import 'package:Eutychia/ui/screens/tests/generic_questionnaire/generic_questionnaire_widget.dart';
import 'package:Eutychia/ui/screens/tests/stroop_test_color/stroop_test_color_widget.dart';
import 'package:Eutychia/ui/screens/tests/stroop_test_directions/stroop_test_directions_widget.dart';
import 'package:flutter/material.dart';

import 'ui/screens/login_screen.dart';

void main() {
  final DisplayFactory _displayFactory = DisplayFactory();

  runApp(new MaterialApp(
      title: "Eutychia",
      home: LoginScreen(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => LoginScreen(),
        '/testoverview': (BuildContext context) => TestOverview(),
        '/genericquestionnaire': (BuildContext context) =>
            GenericQuestionnaireWidget(_displayFactory),
        '/strooptestcolor': (BuildContext context) =>
            StroopTestColorWidget(_displayFactory),
        '/strooptestdirections': (BuildContext context) =>
            StroopTestDirectionWidget(_displayFactory)
      },
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
