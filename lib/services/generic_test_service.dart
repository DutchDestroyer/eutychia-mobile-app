import 'package:dartz/dartz.dart';
import 'package:openapi/api.dart';

class GenericTestService {
  final DefaultApi _clientApi;
  GenericTestService(this._clientApi);

  Future<Either<dynamic, GenericTest>> getTest(
      String projectID, String testID) async {
    return await Task(
            () => _clientApi.getGenericTestOfProject(projectID, testID))
        .attempt()
        .run();
  }
}
