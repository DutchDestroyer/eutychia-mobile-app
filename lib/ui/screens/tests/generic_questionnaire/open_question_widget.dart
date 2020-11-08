import 'package:Eutychia/models/answers/generic_questionnaire_answer.dart';
import 'package:Eutychia/models/questionnaires/generic_question.dart';
import 'package:flutter/material.dart';

class OpenQuestionWidget extends StatefulWidget {
  final GenericQuestion _question;
  final Function _nextQuestionClicked;
  OpenQuestionWidget(this._question, this._nextQuestionClicked);
  @override
  OpenQuestionWidgetState createState() =>
      OpenQuestionWidgetState(_question, _nextQuestionClicked);
}

class OpenQuestionWidgetState extends State<OpenQuestionWidget> {
  final textController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final GenericQuestion _question;
  final Function _nextQuestionClicked;

  OpenQuestionWidgetState(this._question, this._nextQuestionClicked);
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          Text(_question.question),
          TextFormField(
            controller: textController,
            decoration: InputDecoration(labelText: 'Answer:'),
            validator: (value) {
              if (value.trim().isEmpty) {
                return 'Please insert your answer';
              }
              return null;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _nextQuestionClicked(
                    GenericQuestionnaireAnswer(textController.text));
              }
            },
            child: Text('Next'),
          )
        ]));
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
  }
}