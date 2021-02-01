import 'package:Eutychia/api/lib/api.dart';
import 'package:Eutychia/models/new/app_account.dart';
import 'package:Eutychia/models/questionnaires/equestion_type.dart';
import 'package:Eutychia/models/questionnaires/generic_question.dart';
import 'package:Eutychia/models/questionnaires/generic_questionnaire.dart';
import 'package:Eutychia/viewmodels/tests/base_viewmodel_tests.dart';
import 'package:dartz/dartz.dart';

class GenericQuestionnaireViewModel extends BaseViewModelTests {
  final AppAccount _appAccount;

  GenericQuestionnaireViewModel(this._appAccount);

  Future<Either<dynamic, GenericQuestionnaire>> getGenericTestData(
      String testID, String projectID) async {
    var result =
        await _appAccount.genericTestService.getTest(projectID, testID);

    return result.map((r) => GenericQuestionnaire(createQuestions(r.questions),
        r.title, r.description, r.displayAnswers, r.finalRemark));
  }

  List<GenericQuestion> createQuestions(List<GenericTestQuestions> questions) {
    return questions
        .map((e) => GenericQuestion(
            e.question, createQuestionType(e.questionType), e.answers))
        .toList();
  }

  QuestionType createQuestionType(
      GenericTestQuestionsQuestionTypeEnum questionType) {
    if (questionType == GenericTestQuestionsQuestionTypeEnum.multiplechoice_) {
      return QuestionType.multipleChoice;
    } else if (questionType ==
        GenericTestQuestionsQuestionTypeEnum.openquestion_) {
      return QuestionType.openQuestion;
    } else if (questionType == GenericTestQuestionsQuestionTypeEnum.slider_) {
      return QuestionType.slider;
    } else {
      throw Error();
    }
  }
}
