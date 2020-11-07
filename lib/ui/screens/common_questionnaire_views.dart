import 'package:Eutychia/ui/screens/test_overview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionDescription extends StatelessWidget {
  final VoidCallback callback;
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
                Navigator.pushReplacement(context,
                    new MaterialPageRoute(builder: (context) => TestOverview()))
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
