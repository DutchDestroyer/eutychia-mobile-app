import 'package:Eutychia/models/questionnaires/equestionnaire_type.dart';
import 'package:Eutychia/models/questionnaires/generic_question.dart';
import 'package:flutter/material.dart';

class OpenQuestionWidget extends StatefulWidget {
  final GenericQuestion _question;
  final Function _nextQuestionClicked;
  final QuestionnaireType _questionnaireType;
  OpenQuestionWidget(
      this._question, this._nextQuestionClicked, this._questionnaireType);
  @override
  OpenQuestionWidgetState createState() => OpenQuestionWidgetState(
      _question, _nextQuestionClicked, _questionnaireType);
}

class OpenQuestionWidgetState extends State<OpenQuestionWidget> {
  final textController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final GenericQuestion _question;
  final Function _nextQuestionClicked;
  final QuestionnaireType _questionnaireType;

  OpenQuestionWidgetState(
      this._question, this._nextQuestionClicked, this._questionnaireType);
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
                _nextQuestionClicked(_questionnaireType, textController.text);
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
