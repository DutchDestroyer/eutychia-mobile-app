import 'package:Eutychia/models/new/app_account.dart';
import 'package:Eutychia/models/new/test.dart' as apptest;
import 'package:Eutychia/models/questionnaires/equestionnaire_type.dart';
import 'package:dartz/dartz.dart';
import 'package:openapi/api.dart';

class TestOverviewViewmodel {
  final AppAccount _appAccount;

  TestOverviewViewmodel(this._appAccount);

  Future<Either<dynamic, List<apptest.Test>>> getTestsOfProjectForAccount(
      String projectID) async {
    var result = await _appAccount.fetchTestService
        .getProjectsOfAccount(_appAccount.loginData.accountID, projectID);

    return result.map((r) => r.testsToPerform
        .map((t) =>
            apptest.Test(t.testID, t.testName, _getCorrectEnum(t.testType)))
        .toList());
  }

  QuestionnaireType _getCorrectEnum(TestTestTypeEnum testType) {
    if (testType == TestTestTypeEnum.generic_) {
      return QuestionnaireType.generic;
    } else if (testType == TestTestTypeEnum.stroopcolor_) {
      return QuestionnaireType.stroopTestColor;
    } else if (testType == TestTestTypeEnum.stroopdirection_) {
      return QuestionnaireType.stroopTestDirection;
    } else {
      throw Error();
    }
  }

  void updateTestsOfProject(List<apptest.Test> tests, String projectID) {
    _appAccount.projects
        .firstWhere((p) => p.projectID == projectID, )
        .updateTests(tests);
  }
}
