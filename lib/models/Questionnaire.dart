import 'package:Eutychia/models/Question.dart';

import 'package:json_annotation/json_annotation.dart';

part 'questionnaire.g.dart';

@JsonSerializable(explicitToJson: true)
class Questionnaire {
  final String title;
  final int numberOfQuestions;
  final List<Question> questions;

  Questionnaire(this.title, this.numberOfQuestions, this.questions);

  factory Questionnaire.fromJson(Map<String, dynamic> json) =>
      _$QuestionnaireFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionnaireToJson(this);
}
