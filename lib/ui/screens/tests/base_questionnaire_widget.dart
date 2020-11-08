import 'package:Eutychia/models/answers/base_questionnaire_answers.dart';
import 'package:Eutychia/models/answers/generic_questionnaire_answer.dart';
import 'package:Eutychia/models/answers/generic_questionnaire_answers.dart';
import 'package:Eutychia/models/answers/stroop_test_color_answer.dart';
import 'package:Eutychia/models/answers/stroop_test_color_answers.dart';
import 'package:Eutychia/models/answers/stroop_test_direction_answer.dart';
import 'package:Eutychia/models/answers/stroop_test_direction_answers.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseQuestionnaireWidget extends State<StatefulWidget> {
  CarouselController buttonCarouselController = CarouselController();
  BaseQuestionnaireAnswers answers;
  Stopwatch sw = Stopwatch();

  String appBarTitle = 'Waiting';

  void updateBarTitle(String title) {
    setState(() {
      appBarTitle = title;
    });
  }

  void nextQuestionClicked([Object answer]) {
    sw.stop();
    print("time elapsed ${sw.elapsedMilliseconds}");
    setState(() {
      if (answer != null) {
        setAnswer(answer, sw.elapsedMilliseconds);
      }
    });
    sw.reset();
    sw.start();
    buttonCarouselController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.linear);
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
