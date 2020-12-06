import 'package:Eutychia/models/new/project.dart' as appProject;
import 'package:dartz/dartz.dart';
import 'package:openapi/api.dart';

class ProjectsService {
  final DefaultApi _clientApi;
  ProjectsService(this._clientApi);

  Future<Either<Exception, List<appProject.Project>>> getTestsOfProject(
      String accountID) async {
    var result = await Task(() => _clientApi.getProjectsOfAccount(accountID))
        .attempt()
        .run();

    return result.map((r) => r.projects.forEach((element) {
          appProject.Project(element.projectID, element.projectName);
        }));
  }
}
