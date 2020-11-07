import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionDescription extends StatelessWidget {
  final Function callback;
  QuestionDescription(this.callback);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('Description'),
      ElevatedButton(onPressed: callback, child: Text('Start'))
    ]);
  }
}

class EndOfQuestionnaireNoAnswers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('Description'),
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
