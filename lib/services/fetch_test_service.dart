import 'package:Eutychia/api/lib/api.dart';
import 'package:dartz/dartz.dart';

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
