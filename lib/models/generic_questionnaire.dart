import 'package:Eutychia/models/base_questionnaire.dart';
import 'package:Eutychia/models/generic_question.dart';

import 'package:json_annotation/json_annotation.dart';

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
