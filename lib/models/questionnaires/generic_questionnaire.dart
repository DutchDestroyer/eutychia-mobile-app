import 'base_questionnaire.dart';
import 'generic_question.dart';

class GenericQuestionnaire extends BaseQuestionnaire {
  final List<GenericQuestion> questions;

  GenericQuestionnaire(this.questions, String title, String description,
      bool displayAnswers, String finalRemark)
      : super(title, description, displayAnswers, finalRemark);
}
