import 'package:Eutychia/models/new/app_account.dart';
import 'package:dartz/dartz.dart';
import 'package:Eutychia/models/new/project.dart';

class ProjectOverviewViewmodel {
  final AppAccount _appAccount;

  ProjectOverviewViewmodel(this._appAccount);

  Future<Either<dynamic, List<Project>>> getTestsOfProject() async {
    var result = await _appAccount.projectService
        .getTestsOfProject(_appAccount.loginData.accountId);

    return result.map((r) =>
        r.projects.map((e) => Project(e.projectID, e.projectName)).toList());
  }

  void updateProjects(List<Project> projects) {
    _appAccount.updateProjects(projects);
  }
}
