import 'package:Eutychia/models/generic_question.dart';

import 'package:json_annotation/json_annotation.dart';

part 'generic_questionnaire.g.dart';

@JsonSerializable(explicitToJson: true)
class GenericQuestionnaire {
  final String title;
  final List<GenericQuestion> questions;

  GenericQuestionnaire(this.title, this.questions);

  factory GenericQuestionnaire.fromJson(Map<String, dynamic> json) =>
      _$GenericQuestionnaireFromJson(json);

  Map<String, dynamic> toJson() => _$GenericQuestionnaireToJson(this);
}
