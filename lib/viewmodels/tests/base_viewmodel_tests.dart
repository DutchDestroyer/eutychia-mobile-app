import 'package:Eutychia/models/answers/base_questionnaire_answers.dart';
import 'package:Eutychia/models/answers/generic_questionnaire_answer.dart';
import 'package:Eutychia/models/answers/generic_questionnaire_answers.dart';
import 'package:Eutychia/models/answers/stroop_test_color_answer.dart';
import 'package:Eutychia/models/answers/stroop_test_color_answers.dart';
import 'package:Eutychia/models/answers/stroop_test_direction_answer.dart';
import 'package:Eutychia/models/answers/stroop_test_direction_answers.dart';

class BaseViewModelTests {
  BaseQuestionnaireAnswers answers;
  Stopwatch _sw = Stopwatch();

  void updateAnswers([Object answer]) {
    _sw.stop();
    print("time elapsed ${_sw.elapsedMilliseconds}");
    if (answer != null) {
      setAnswer(answer, _sw.elapsedMilliseconds);
    }

    _sw.reset();
    _sw.start();
  }

  void setAnswer(Object answer, int elapsedTime) {
    if (answer is GenericQuestionnaireAnswer) {
      answer.time = elapsedTime;
      if (answers == null) {
        answers = GenericQuestionnaireAnswers<GenericQuestionnaireAnswer>();
      }
      answers.add(answer);
    } else if (answer is StroopTestDirectionAnswer) {
      answer.time = elapsedTime;
      if (answers == null) {
        answers = StroopTestDirectionAnswers<StroopTestDirectionAnswer>();
      }
      answers.add(answer);
    } else if (answer is StroopTestColorAnswer) {
      answer.time = elapsedTime;
      if (answers == null) {
        answers = StroopTestColorAnswers<StroopTestColorAnswer>();
      }
      answers.add(answer);
    } else {
      throw Error();
    }
  }
}
