import 'package:Eutychia/models/new/app_account.dart';
import 'package:dartz/dartz.dart';
import 'package:Eutychia/models/new/project.dart' as appProject;

class ProjectOverviewViewmodel {
  final AppAccount _appAccount;

  ProjectOverviewViewmodel(this._appAccount);

  Future<Either<dynamic, List<appProject.Project>>> getTestsOfProject() async {
    var result = await _appAccount.projectService
        .getTestsOfProject(_appAccount.loginData.accountId);

    return result.map((r) =>
        r.projects.map((e) => appProject.Project(e.projectID, e.projectName)));
  }
}
