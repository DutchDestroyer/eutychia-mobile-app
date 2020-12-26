import 'package:Eutychia/models/answers/base_questionnaire_answers.dart';
import 'package:Eutychia/models/answers/generic_questionnaire_answers.dart';
import 'package:Eutychia/models/answers/stroop_test_color_answers.dart';
import 'package:Eutychia/models/answers/stroop_test_direction_answers.dart';
import 'package:Eutychia/ui/screens/tests/stroop_test_color/stroop_test_color_end_view.dart';
import 'package:Eutychia/ui/screens/tests/stroop_test_directions/stroop_test_direction_end_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Eutychia/ui/screens/progress_bar_indicator.dart';

import '../test_overview.dart';
import 'generic_questionnaire/generic_questionnaire_end_view.dart';
import 'package:Eutychia/viewmodels/end_of_questionnaire_viewmodel.dart';
import 'package:dartz/dartz.dart';

class QuestionDescription extends StatelessWidget {
  final Function _callback;
  final String _description;
  QuestionDescription(this._callback, this._description);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(_description),
      ElevatedButton(onPressed: _callback, child: Text('Start'))
    ]);
  }
}

class EndOfQuestionnaireWidget extends StatelessWidget {
  final String _finalRemark;
  final bool _displayAnswers;
  final BaseQuestionnaireAnswers _answers;
  final EndOfQuestionnaireViewModel _endOfQuestionnaireViewModel;
  final String _projectID;
  final String _testID;

  EndOfQuestionnaireWidget(
      this._finalRemark,
      this._displayAnswers,
      this._answers,
      this._endOfQuestionnaireViewModel,
      this._projectID,
      this._testID);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Either<dynamic, dynamic>>(
        future: _endOfQuestionnaireViewModel.submitTestAnswers(
            _projectID, _testID, _answers),
        builder: (context, AsyncSnapshot<Either<dynamic, dynamic>> snapshot) {
          if (snapshot.hasData) {
            return snapshot.data.fold(
                (l) => Text("oh oh, something went wrong"),
                (r) => Column(children: [
                      Text(_finalRemark),
                      _EndOfQuestionnaireDisplayAnswers(
                          _displayAnswers, _answers),
                      ElevatedButton(
                          onPressed: () => {
                                Navigator.popUntil(
                                    context,
                                    ModalRoute.withName(
                                        TestOverviewWidget.routeName))
                              },
                          child: Text('Finish'))
                    ]));
          } else {
            return progressBarIndicator();
          }
        });
  }
}

class _EndOfQuestionnaireDisplayAnswers extends StatelessWidget {
  final bool _displayAnswers;
  final BaseQuestionnaireAnswers _answers;
  _EndOfQuestionnaireDisplayAnswers(this._displayAnswers, this._answers);

  @override
  Widget build(BuildContext context) {
    if (!_displayAnswers) {
      return Text("For this test, no answers will be displayed");
    } else {
      return _endOfQuestionnaireViewFactory();
    }
  }

  Widget _endOfQuestionnaireViewFactory() {
    if (_answers is GenericQuestionnaireAnswers) {
      return GenericQuestionnaireEndView(_answers);
    } else if (_answers is StroopTestColorAnswers) {
      return StroopTestColorEndView(_answers);
    } else if (_answers is StroopTestDirectionAnswers) {
      return StroopTestDirectionEndView(_answers);
    } else {
      throw Error();
    }
  }
}
