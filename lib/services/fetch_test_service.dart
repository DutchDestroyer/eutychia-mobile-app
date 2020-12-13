import 'package:dartz/dartz.dart';
import 'package:openapi/api.dart';

class FetchTestService {
  final DefaultApi _clientApi;
  FetchTestService(this._clientApi);

  Future<Either<dynamic, TestsProject>> getProjectsOfAccount(
      String accountID, String projectID) async {
    return await Task(
            () => _clientApi.getTestsToPerformByAccount(projectID, accountID))
        .attempt()
        .run();
  }
}
