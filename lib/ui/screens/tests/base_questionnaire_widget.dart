import 'package:Eutychia/models/answers/generic_questionnaire_answer.dart';
import 'package:Eutychia/models/answers/stroop_test_color_answer.dart';
import 'package:Eutychia/models/answers/stroop_test_direction_answer.dart';
import 'package:Eutychia/models/questionnaires/equestionnaire_type.dart';
import 'package:Eutychia/models/questionnaires/estroop_direction_type.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseQuestionnaireWidget extends State<StatefulWidget> {
  CarouselController buttonCarouselController = CarouselController();
  List<Object> answers = List<Object>();
  Stopwatch sw = Stopwatch();

  String appBarTitle = 'Waiting';

  void updateBarTitle(String title) {
    setState(() {
      appBarTitle = title;
    });
  }

  void nextQuestionClicked(
      [QuestionnaireType questionnaireType, Object answer]) {
    sw.stop();
    print("time elapsed ${sw.elapsedMilliseconds}");
    setState(() {
      if (answer != null) {
        setAnswer(questionnaireType, answer, sw.elapsedMilliseconds);
      }
    });
    buttonCarouselController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.linear);
    sw.reset();
    sw.start();
  }

  void setAnswer(
      QuestionnaireType questionnaireType, Object answer, int elapsedTime) {
    switch (questionnaireType) {
      case QuestionnaireType.phq9:
        if (answer is String) {
          answers.add(GenericQuestionnaireAnswer(answer, elapsedTime));
        } else {
          throw Error();
        }
        break;
      case QuestionnaireType.stroopTestColor:
        if (answer is List<bool>) {
          answers.add(StroopTestColorAnswer(answer, elapsedTime));
        } else {
          throw Error();
        }
        break;
      case QuestionnaireType.stroopTestDirection:
        if (answer is StroopDirectionType) {
          answers.add(StroopTestDirectionAnswer(answer, elapsedTime));
        } else {
          throw Error();
        }
        break;
      default:
        throw Error();
    }
  }
}
