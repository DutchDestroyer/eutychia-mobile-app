import 'package:Eutychia/models/new/app_account.dart';
import 'package:Eutychia/services/login_service.dart';
import 'package:Eutychia/services/projects_service.dart';
import 'package:Eutychia/ui/screens/project_overview.dart';
import 'package:Eutychia/ui/screens/test_overview.dart';
import 'package:Eutychia/ui/screens/tests/display_factory.dart';
import 'package:Eutychia/ui/screens/tests/generic_questionnaire/generic_questionnaire_widget.dart';
import 'package:Eutychia/ui/screens/tests/stroop_test_color/stroop_test_color_widget.dart';
import 'package:Eutychia/ui/screens/tests/stroop_test_directions/stroop_test_directions_widget.dart';
import 'package:Eutychia/viewmodels/login_screen_viewmodel.dart';
import 'package:Eutychia/viewmodels/project_overview_viewmodel.dart';
import 'package:Eutychia/viewmodels/tests/generic_questionnaire_viewmodel.dart';
import 'package:Eutychia/viewmodels/tests/stroop_test_color_viewmodel.dart';
import 'package:Eutychia/viewmodels/tests/stroop_test_direction_viewmodel.dart';
import 'package:flutter/material.dart';

import 'package:openapi/api.dart';

import 'ui/screens/login_screen.dart';
import 'ui/screens/test_overview.dart';

void main() async {
  var _appAccount = createAccount();

  final DisplayFactory _displayFactory = DisplayFactory();
  final GenericQuestionnaireViewModel _genericQuestionnaireViewModel =
      GenericQuestionnaireViewModel();
  final StroopTestDirectionViewModel _stroopTestDirectionViewModel =
      StroopTestDirectionViewModel();
  final StroopTestColorViewModel _stroopTestColorViewModel =
      StroopTestColorViewModel();

  final LoginScreenViewModel _loginScreenViewModel =
      LoginScreenViewModel(_appAccount);
  final ProjectOverviewViewmodel _projectOverviewViewmodel =
      ProjectOverviewViewmodel(_appAccount);

  runApp(new MaterialApp(
      title: "Eutychia",
      home: LoginScreenWidget(_loginScreenViewModel),
      routes: <String, WidgetBuilder>{
        LoginScreenWidget.routeName: (BuildContext context) =>
            LoginScreenWidget(_loginScreenViewModel),
        ProjectOverviewWidget.routeName: (BuildContext context) =>
            ProjectOverviewWidget(_projectOverviewViewmodel),
        TestOverviewWidget.routeName: (BuildContext context) =>
            TestOverviewWidget(),
        GenericQuestionnaireWidget.routeName: (BuildContext context) =>
            GenericQuestionnaireWidget(
                _displayFactory, _genericQuestionnaireViewModel),
        StroopTestColorWidget.routename: (BuildContext context) =>
            StroopTestColorWidget(_displayFactory, _stroopTestColorViewModel),
        StroopTestDirectionWidget.routename: (BuildContext context) =>
            StroopTestDirectionWidget(
                _displayFactory, _stroopTestDirectionViewModel)
      },
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Colors.green,
        elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            return _getThemeColor(states);
          }),
        )),
      )));
}

AppAccount createAccount() {
  final ApiClient _apiClient =
      new ApiClient(basePath: "http://10.0.2.2:8080/api");
  final DefaultApi _defaultApi = DefaultApi(_apiClient);

  final LoginService _loginService = LoginService(_defaultApi);
  final ProjectsService _projectsService = ProjectsService(_defaultApi);
  final AppAccount _appAccount = AppAccount(_loginService, _projectsService);
  return _appAccount;
}

MaterialColor _getThemeColor(Set<MaterialState> states) {
  if (states.contains(MaterialState.pressed)) {
    return Colors.blue;
  } else if (states.contains(MaterialState.disabled)) {
    return Colors.grey;
  } else {
    return Colors.red;
  }
}
