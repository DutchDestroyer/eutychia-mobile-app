import 'dart:convert';

import 'package:Eutychia/models/Question.dart';
import 'package:Eutychia/models/Questionnaire.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Questionnaire1 extends StatefulWidget {
  @override
  _QuestionnaireScaffoldState createState() => _QuestionnaireScaffoldState();
}

class _QuestionnaireScaffoldState extends State<Questionnaire1> {
  String _appBarTitle = 'Waiting';
  int _questionIndex = 0;
  Question _questionToShow;
  List<String> _answers = List<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_appBarTitle)),
      body: FutureBuilder<Questionnaire>(
          future: parseJson(),
          builder: (context, AsyncSnapshot<Questionnaire> snapshot) {
            if (snapshot.hasData) {
              WidgetsBinding.instance.addPostFrameCallback(
                  (_) => updateBarTitle(snapshot.data.title));
              if (_questionIndex < snapshot.data.numberOfQuestions) {
                _questionToShow = snapshot.data.questions[_questionIndex];
                return QuestionnaireWidget(_questionToShow, this);
              } else {
                return EndOfQuestionnaireWidget(_answers);
              }
            } else {
              return Text('waiting');
            }
          }),
    );
  }

  void updateBarTitle(String title) {
    setState(() {
      _appBarTitle = title;
    });
  }

  void updateQuestionToShow() {
    setState(() {
      _questionIndex += 1;
    });
  }

  void updateAnswers(String answer) {
    setState(() {
      _answers.add(answer);
    });
  }
}

class EndOfQuestionnaireWidget extends StatelessWidget {
  List<String> _answers;
  EndOfQuestionnaireWidget(this._answers);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Finished, your answers are:'),
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: _answers.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(_answers[index]);
            })
      ],
    );
  }
}

class QuestionnaireWidget extends StatelessWidget {
  final Question _question;
  final _QuestionnaireScaffoldState _questionnaireScaffoldState;
  QuestionnaireWidget(this._question, this._questionnaireScaffoldState);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_question.question),
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: _question.answers.length,
            itemBuilder: (BuildContext context, int index) {
              return RaisedButton(
                onPressed: () {
                  _questionnaireScaffoldState
                      .updateAnswers((index + 1).toString());
                  _questionnaireScaffoldState.updateQuestionToShow();
                },
                child: Text(_question.answers[index]),
              );
            })
      ],
    );
  }
}

Future<Questionnaire> parseJson() async {
  String jsonString =
      await rootBundle.loadString('assets/questionnaires/questionnaire1.json');
  final jsonResponse = jsonDecode(jsonString);
  return Questionnaire.fromJson(jsonResponse);
}
