import 'package:dartz/dartz.dart';
import 'package:openapi/api.dart';
import 'package:Eutychia/models/answers/generic_questionnaire_answers.dart';

class SubmitAnswersService {
  final DefaultApi _clientApi;
  SubmitAnswersService(this._clientApi);

  Future<Either<dynamic, dynamic>> submitGenericTestAnswers(
      String projectID,
      String testID,
      String accountID,
      GenericQuestionnaireAnswers genericTestAnswers) async {
    return await Task(() => _clientApi.submitAnswerToTest(projectID, testID,
            _createGenericTestAnswers(genericTestAnswers, accountID)))
        .attempt()
        .run();
  }

  GenericTestAnswers _createGenericTestAnswers(
      GenericQuestionnaireAnswers answers, String accountID) {
    var genericAnswers = answers.answers
        .asMap()
        .entries
        .map((answer) => AnswerToQuestion(
            answer: answer.value.answer,
            question: answer.key,
            timeToAnswer: answer.value.time))
        .toList();

    return GenericTestAnswers(accountID: accountID, answers: genericAnswers);
  }
}
