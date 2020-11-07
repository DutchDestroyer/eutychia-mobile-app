import 'package:Eutychia/models/equestion_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generic_question.g.dart';

@JsonSerializable()
class GenericQuestion {
  final String question;
  final QuestionType questionType;
  final List<String> answers;

  GenericQuestion(this.question, this.questionType, this.answers);

  factory GenericQuestion.fromJson(Map<String, dynamic> json) =>
      _$GenericQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$GenericQuestionToJson(this);
}
