import 'package:Eutychia/models/equestion_type.dart';
import 'package:Eutychia/models/generic_question.dart';
import 'package:Eutychia/models/stroop_test_color_task.dart';
import 'package:Eutychia/models/stroop_test_direction_object.dart';
import 'package:Eutychia/ui/screens/tests/stroop_test_color/stroop_test_color_task_widget.dart';
import 'package:Eutychia/ui/screens/tests/stroop_test_directions/stroop_test_direction_task_widget.dart';
import 'package:flutter/cupertino.dart';

import '../common_questionnaire_views.dart';
import 'generic_questionnaire/multiple_choice_widget.dart';
import 'generic_questionnaire/open_question_widget.dart';
import 'generic_questionnaire/slider_widget.dart';

class DisplayFactory {
  Widget partOfQuestionnaireToDisplayFactory(
      int index, List<Object> tasks, Function _nextQuestionClicked) {
    if (index == 0) {
      return QuestionDescription(_nextQuestionClicked);
    } else if (index == tasks.length + 1) {
      return EndOfQuestionnaireNoAnswers();
    } else {
      return questionSelector(_nextQuestionClicked, tasks[index - 1]);
    }
  }

  Widget questionSelector(Function nextQuestionClicked, Object task) {
    if (task is StroopTestDirectionObject) {
      return StroopTestDirectionTaskWidget(nextQuestionClicked, task);
    } else if (task is StroopTestColorTask) {
      return StroopTestColorTaskWidget(nextQuestionClicked, task);
    } else if (task is GenericQuestion) {
      return questionnaireWidgetFactory(nextQuestionClicked, task);
    } else {
      throw Error();
    }
  }

  Widget questionnaireWidgetFactory(
      Function nextQuestionClicked, GenericQuestion question) {
    switch (question.questionType) {
      case QuestionType.multipleChoice:
        return MultipleChoiceWidget(question, nextQuestionClicked);
      case QuestionType.openQuestion:
        return OpenQuestionWidget(question, nextQuestionClicked);
      case QuestionType.slider:
        return SliderQuestionWidget(question, nextQuestionClicked);
      default:
        throw Error();
    }
  }
}
