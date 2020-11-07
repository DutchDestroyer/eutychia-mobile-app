import 'package:Eutychia/models/questionnaires/equestionnaire_type.dart';

abstract class BaseQuestionnaire {
  final String title;
  final String description;
  final bool displayAnswers;
  final String finalRemark;
  final QuestionnaireType questionnaireType;

  BaseQuestionnaire(this.title, this.description, this.displayAnswers,
      this.finalRemark, this.questionnaireType);
}
