import 'package:Eutychia/models/answers/base_questionnaire_answers.dart';
import 'package:Eutychia/models/questionnaires/equestion_type.dart';
import 'package:Eutychia/models/questionnaires/generic_question.dart';
import 'package:Eutychia/viewmodels/end_of_questionnaire_viewmodel.dart';
import 'package:Eutychia/models/questionnaires/stroop_test_color_task.dart';
import 'package:Eutychia/models/questionnaires/stroop_test_direction_object.dart';
import 'package:Eutychia/ui/screens/tests/stroop_test_color/stroop_test_color_task_widget.dart';
import 'package:Eutychia/ui/screens/tests/stroop_test_directions/stroop_test_direction_task_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

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
      BaseQuestionnaireAnswers answers,
      EndOfQuestionnaireViewModel endOfQuestionnaireViewmodel,
      String projectID,
      String testID) {
    if (index == 0) {
      return QuestionDescription(nextQuestionClicked, description);
    } else if (index == tasks.length + 1) {
      return ChangeNotifierProvider(
          create: (context) => BaseQuestionnaireAnswers(),
          child: EndOfQuestionnaireWidget(finalRemark, displayAnswers, answers,
              endOfQuestionnaireViewmodel, projectID, testID));
    } else {
      return _questionSelector(nextQuestionClicked, tasks[index - 1]);
    }
  }

  Widget _questionSelector(Function nextQuestionClicked, Object task) {
    if (task is StroopTestDirectionObject) {
      return StroopTestDirectionTaskWidget(nextQuestionClicked, task);
    } else if (task is StroopTestColorTask) {
      return StroopTestColorTaskWidget(nextQuestionClicked, task);
    } else if (task is GenericQuestion) {
      return _questionnaireWidgetFactory(nextQuestionClicked, task);
    } else {
      throw Error();
    }
  }

  Widget _questionnaireWidgetFactory(
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
