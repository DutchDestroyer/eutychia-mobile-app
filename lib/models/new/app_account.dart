import 'package:Eutychia/models/new/project.dart';
import 'package:Eutychia/services/login_service.dart';
import 'package:Eutychia/services/projects_service.dart';

import 'account_login_data.dart';

class AppAccount {
  final LoginService loginService;
  final ProjectsService projectService;

  String emailAddress;

  AccountLoginData _loginData;
  AccountLoginData get loginData => _loginData;
  List<Project> _projects;
  List<Project> get projects => _projects;

  AppAccount(this.loginService, this.projectService);

  void updateLoginData(AccountLoginData loginData) {
    _loginData = loginData;
  }

  void updateProjects(List<Project> projects) {
    _projects = projects;
  }
}
