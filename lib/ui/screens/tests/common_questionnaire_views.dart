import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class EndOfQuestionnaireNoAnswers extends StatelessWidget {
  final String _finalRemark;
  EndOfQuestionnaireNoAnswers(this._finalRemark);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(_finalRemark),
      ElevatedButton(
          onPressed: () => {
                Navigator.popUntil(
                    context, ModalRoute.withName('/testoverview'))
              },
          child: Text('Finish'))
    ]);
  }
}

class EndOfQuestionnaireDisplayAnswers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
