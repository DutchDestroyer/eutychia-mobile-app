import 'package:Eutychia/models/questionnaires/equestionnaire_type.dart';
import 'package:json_annotation/json_annotation.dart';

import 'base_questionnaire.dart';
import 'generic_question.dart';

part 'generic_questionnaire.g.dart';

@JsonSerializable(explicitToJson: true)
class GenericQuestionnaire extends BaseQuestionnaire {
  final List<GenericQuestion> questions;

  GenericQuestionnaire(
      this.questions,
      String title,
      String description,
      bool displayAnswers,
      String finalRemark,
      QuestionnaireType questionnaireType)
      : super(
            title, description, displayAnswers, finalRemark, questionnaireType);

  factory GenericQuestionnaire.fromJson(Map<String, dynamic> json) =>
      _$GenericQuestionnaireFromJson(json);

  Map<String, dynamic> toJson() => _$GenericQuestionnaireToJson(this);
}
