import 'package:Eutychia/ui/screens/test_overview.dart';
import 'package:Eutychia/ui/screens/tests/display_factory.dart';
import 'package:Eutychia/ui/screens/tests/generic_questionnaire/generic_questionnaire_widget.dart';
import 'package:Eutychia/ui/screens/tests/stroop_test_color/stroop_test_color_widget.dart';
import 'package:Eutychia/ui/screens/tests/stroop_test_directions/stroop_test_directions_widget.dart';
import 'package:Eutychia/viewmodels/tests/generic_questionnaire_viewmodel.dart';
import 'package:Eutychia/viewmodels/tests/stroop_test_color_viewmodel.dart';
import 'package:Eutychia/viewmodels/tests/stroop_test_direction_viewmodel.dart';
import 'package:flutter/material.dart';

import 'ui/screens/login_screen.dart';

void main() {
  final DisplayFactory _displayFactory = DisplayFactory();
  final GenericQuestionnaireViewModel _genericQuestionnaireViewModel =
      GenericQuestionnaireViewModel();
  final StroopTestDirectionViewModel _stroopTestDirectionViewModel =
      StroopTestDirectionViewModel();
  final StroopTestColorViewModel _stroopTestColorViewModel =
      StroopTestColorViewModel();
  runApp(new MaterialApp(
      title: "Eutychia",
      home: LoginScreen(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => LoginScreen(),
        '/testoverview': (BuildContext context) => TestOverview(),
        '/genericquestionnaire': (BuildContext context) =>
            GenericQuestionnaireWidget(
                _displayFactory, _genericQuestionnaireViewModel),
        '/strooptestcolor': (BuildContext context) =>
            StroopTestColorWidget(_displayFactory, _stroopTestColorViewModel),
        '/strooptestdirections': (BuildContext context) =>
            StroopTestDirectionWidget(
                _displayFactory, _stroopTestDirectionViewModel)
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
