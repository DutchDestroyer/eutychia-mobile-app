import 'package:Eutychia/models/questiontype.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';

@JsonSerializable()
class Question {
  final String question;
  final QuestionType questionType;
  final List<String> answers;

  Question(this.question, this.questionType, this.answers);

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
