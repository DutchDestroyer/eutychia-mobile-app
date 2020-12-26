import 'package:Eutychia/models/new/app_account.dart';
import 'package:Eutychia/models/answers/generic_questionnaire_answers.dart';
import 'package:Eutychia/models/answers/base_questionnaire_answers.dart';
import 'package:dartz/dartz.dart';

class EndOfQuestionnaireViewModel {
  final AppAccount _appAccount;

  EndOfQuestionnaireViewModel(this._appAccount);

  Future<Either<dynamic, dynamic>> submitTestAnswers(
      String projectID, String testID, BaseQuestionnaireAnswers answers) async {
    if (answers is GenericQuestionnaireAnswers) {
      return await _appAccount.submitAnswersService.submitGenericTestAnswers(
          projectID, testID, _appAccount.loginData.accountID, answers);
    }
    throw Error();
  }
}
