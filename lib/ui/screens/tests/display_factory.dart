import 'package:Eutychia/models/questionnaires/equestion_type.dart';
import 'package:Eutychia/models/questionnaires/equestionnaire_type.dart';
import 'package:Eutychia/models/questionnaires/generic_question.dart';
import 'package:Eutychia/models/questionnaires/stroop_test_color_task.dart';
import 'package:Eutychia/models/questionnaires/stroop_test_direction_object.dart';
import 'package:Eutychia/ui/screens/tests/stroop_test_color/stroop_test_color_task_widget.dart';
import 'package:Eutychia/ui/screens/tests/stroop_test_directions/stroop_test_direction_task_widget.dart';
import 'package:flutter/cupertino.dart';

import 'common_questionnaire_views.dart';
import 'generic_questionnaire/multiple_choice_widget.dart';
import 'generic_questionnaire/open_question_widget.dart';
import 'generic_questionnaire/slider_widget.dart';

class DisplayFactory {
  Widget partOfQuestionnaireToDisplayFactory(
      int index,
      List<Object> tasks,
      Function nextQuestionClicked,
      String description,
      String finalRemark,
      bool displayAnswers,
      QuestionnaireType questionnaireType,
      [Object answers]) {
    if (index == 0) {
      return QuestionDescription(nextQuestionClicked, description);
    } else if (index == tasks.length + 1) {
      return EndOfQuestionnaireWidget(finalRemark, displayAnswers);
    } else {
      return questionSelector(
          nextQuestionClicked, tasks[index - 1], questionnaireType);
    }
  }

  Widget questionSelector(Function nextQuestionClicked, Object task,
      QuestionnaireType questionnaireType) {
    if (task is StroopTestDirectionObject) {
      return StroopTestDirectionTaskWidget(
          nextQuestionClicked, task, questionnaireType);
    } else if (task is StroopTestColorTask) {
      return StroopTestColorTaskWidget(
          nextQuestionClicked, task, questionnaireType);
    } else if (task is GenericQuestion) {
      return questionnaireWidgetFactory(
          nextQuestionClicked, task, questionnaireType);
    } else {
      throw Error();
    }
  }

  Widget questionnaireWidgetFactory(Function nextQuestionClicked,
      GenericQuestion question, QuestionnaireType questionnaireType) {
    switch (question.questionType) {
      case QuestionType.multipleChoice:
        return MultipleChoiceWidget(
            question, nextQuestionClicked, questionnaireType);
      case QuestionType.openQuestion:
        return OpenQuestionWidget(
            question, nextQuestionClicked, questionnaireType);
      case QuestionType.slider:
        return SliderQuestionWidget(
            question, nextQuestionClicked, questionnaireType);
      default:
        throw Error();
    }
  }
}
