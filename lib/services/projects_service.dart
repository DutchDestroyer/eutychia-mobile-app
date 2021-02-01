import 'package:Eutychia/api/lib/api.dart';
import 'package:dartz/dartz.dart';

class ProjectsService {
  final DefaultApi _clientApi;
  ProjectsService(this._clientApi);

  Future<Either<dynamic, ProjectsAccountId>> getProjectsOfAccount(
      String accountID) async {
    return await Task(() => _clientApi.getProjectsOfAccount(accountID))
        .attempt()
        .run();
  }
}
