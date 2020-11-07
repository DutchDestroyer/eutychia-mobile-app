import 'package:Eutychia/models/questionnaires/generic_question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MultipleChoiceWidget extends StatelessWidget {
  final GenericQuestion _question;
  final Function _nextQuestionClicked;
  MultipleChoiceWidget(this._question, this._nextQuestionClicked);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_question.question),
        Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: _question.answers.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () => _nextQuestionClicked(index.toString()),
                        child: Text(_question.answers[index]),
                      ));
                })),
      ],
    );
  }
}
