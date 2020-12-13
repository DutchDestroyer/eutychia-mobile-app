import 'package:Eutychia/models/new/app_account.dart';
import 'package:dartz/dartz.dart';
import 'package:Eutychia/models/new/project.dart';

class ProjectOverviewViewmodel {
  final AppAccount _appAccount;

  ProjectOverviewViewmodel(this._appAccount);

  Future<Either<dynamic, List<Project>>> getProjectsOfAccount() async {
    var result = await _appAccount.projectService
        .getProjectsOfAccount(_appAccount.loginData.accountID);

    return result.map((r) =>
        r.projects.map((e) => Project(e.projectID, e.projectName)).toList());
  }

  void updateProjects(List<Project> projects) {
    _appAccount.updateProjects(projects);
  }
}
