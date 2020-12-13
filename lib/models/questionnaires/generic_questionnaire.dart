import 'package:json_annotation/json_annotation.dart';

import 'base_questionnaire.dart';
import 'generic_question.dart';

part 'generic_questionnaire.g.dart';

@JsonSerializable(explicitToJson: true)
class GenericQuestionnaire extends BaseQuestionnaire {
  final List<GenericQuestion> questions;

  GenericQuestionnaire(this.questions, String title, String description,
      bool displayAnswers, String finalRemark)
      : super(title, description, displayAnswers, finalRemark);

  factory GenericQuestionnaire.fromJson(Map<String, dynamic> json) =>
      _$GenericQuestionnaireFromJson(json);

  Map<String, dynamic> toJson() => _$GenericQuestionnaireToJson(this);
}
