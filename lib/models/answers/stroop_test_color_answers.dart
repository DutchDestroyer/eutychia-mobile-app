import 'package:Eutychia/models/answers/base_questionnaire_answer.dart';
import 'package:Eutychia/models/answers/stroop_test_color_answer.dart';
import 'package:Eutychia/models/questionnaires/equestionnaire_type.dart';

class StroopTestColorAnswers extends BaseQuestionnaireAnswer {
  final List<StroopTestColorAnswer> answer;

  StroopTestColorAnswers(this.answer, QuestionnaireType questionnaireType)
      : super(questionnaireType);
}
