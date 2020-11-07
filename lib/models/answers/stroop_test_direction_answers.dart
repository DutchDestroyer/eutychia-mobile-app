import 'package:Eutychia/models/answers/base_questionnaire_answer.dart';
import 'package:Eutychia/models/answers/stroop_test_direction_answer.dart';
import 'package:Eutychia/models/questionnaires/equestionnaire_type.dart';

class StroopTestDirectionAnswers extends BaseQuestionnaireAnswer {
  final List<StroopTestDirectionAnswer> answers;

  StroopTestDirectionAnswers(this.answers, QuestionnaireType questionnaireType)
      : super(questionnaireType);
}
