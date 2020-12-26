import 'package:Eutychia/models/answers/generic_questionnaire_answer.dart';
import 'package:Eutychia/models/questionnaires/generic_question.dart';
import 'package:flutter/material.dart';

class OpenQuestionWidget extends StatefulWidget {
  final GenericQuestion _question;
  final Function _nextQuestionClicked;
  OpenQuestionWidget(this._question, this._nextQuestionClicked);
  @override
  _OpenQuestionWidgetState createState() =>
      _OpenQuestionWidgetState(_question, _nextQuestionClicked);
}

class _OpenQuestionWidgetState extends State<OpenQuestionWidget> {
  final _textController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final GenericQuestion _question;
  final Function _nextQuestionClicked;

  _OpenQuestionWidgetState(this._question, this._nextQuestionClicked);
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          Text(_question.question),
          TextFormField(
            controller: _textController,
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
                    GenericQuestionnaireAnswer(_textController.text));
              }
            },
            child: Text('Next'),
          )
        ]));
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _textController.dispose();
    super.dispose();
  }
}
