import 'package:Eutychia/models/answers/base_questionnaire_answers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  EndOfQuestionnaireWidget(
      this._finalRemark, this._displayAnswers, this._answers);

  @override
  Widget build(BuildContext context) {
    return Consumer<BaseQuestionnaireAnswers>(
      builder: (context, answers, child) {
        return Column(children: [
          Text(_finalRemark),
          EndOfQuestionnaireDisplayAnswers(_displayAnswers, _answers),
          ElevatedButton(
              onPressed: () => {
                    Navigator.popUntil(
                        context, ModalRoute.withName('/testoverview'))
                  },
              child: Text('Finish'))
        ]);
      },
    );
  }
}

class EndOfQuestionnaireDisplayAnswers extends StatelessWidget {
  final bool _displayAnswers;
  final BaseQuestionnaireAnswers _answers;
  EndOfQuestionnaireDisplayAnswers(this._displayAnswers, this._answers);

  @override
  Widget build(BuildContext context) {
    if (!_displayAnswers) {
      return Text("For this test, no answers will be displayed");
    } else {
      return Text("number of answers ${_answers.answers.length}");
    }
  }
}
