import 'equestion_type.dart';

class GenericQuestion {
  final String question;
  final QuestionType questionType;
  final List<String> answers;

  GenericQuestion(this.question, this.questionType, this.answers);
}
