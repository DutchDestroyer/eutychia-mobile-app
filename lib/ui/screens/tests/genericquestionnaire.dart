import 'dart:convert';

import 'package:Eutychia/models/Question.dart';
import 'package:Eutychia/models/Questionnaire.dart';
import 'package:Eutychia/models/questiontype.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

import 'package:carousel_slider/carousel_slider.dart';

class GenericQuestionnaire extends StatefulWidget {
  @override
  _QuestionnaireScaffoldState createState() => _QuestionnaireScaffoldState();
}

class _QuestionnaireScaffoldState extends State<GenericQuestionnaire> {
  String _appBarTitle = 'Waiting';
  List<String> _answers = List<String>();
  CarouselController buttonCarouselController = CarouselController();

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
              return CarouselSlider.builder(
                  itemCount: snapshot.data.questions.length + 1,
                  carouselController: buttonCarouselController,
                  itemBuilder: (BuildContext context, int itemIndex) =>
                      Container(
                        child: questionToDisplay(
                            snapshot.data.questions, _answers, this),
                      ),
                  options: CarouselOptions(
                      height: MediaQuery.of(context).size.height,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      autoPlay: false,
                      viewportFraction: 1.0));
            } else {
              return Text('waiting');
            }
          }),
    );
  }

  Future<Questionnaire> parseJson() async {
    String jsonString = await rootBundle
        .loadString('assets/questionnaires/questionnaire1.json');
    final jsonResponse = jsonDecode(jsonString);
    return Questionnaire.fromJson(jsonResponse);
  }

  void updateBarTitle(String title) {
    setState(() {
      _appBarTitle = title;
    });
  }

  void processAnswer(String answer) {
    setState(() {
      _answers.add(answer);
    });
    buttonCarouselController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  Widget questionToDisplay(List<Question> question, List<String> answers,
      _QuestionnaireScaffoldState scaffold) {
    debugPrint('carousselIndex: ${answers.length}');
    if (answers.length < question.length) {
      return questionnaireSelected(question[answers.length], scaffold);
    } else {
      return EndOfQuestionnaireWidget(answers);
    }
  }

  Widget questionnaireSelected(
      Question question, _QuestionnaireScaffoldState scaffold) {
    switch (question.questionType) {
      case QuestionType.multipleChoice:
        return MultipleChoiceWidget(question, scaffold);
      case QuestionType.openQuestion:
        return OpenQuestionWidget(question, scaffold);
      default:
        // TODO create some widget here
        return null;
    }
  }
}

class EndOfQuestionnaireWidget extends StatelessWidget {
  final List<String> _answers;
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
              return Text(
                _answers[index],
              );
            })
      ],
    );
  }
}

class MultipleChoiceWidget extends StatelessWidget {
  final Question _question;
  final _QuestionnaireScaffoldState _questionnaireScaffoldState;
  MultipleChoiceWidget(this._question, this._questionnaireScaffoldState);
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
                        onPressed: () {
                          _questionnaireScaffoldState
                              .processAnswer(index.toString());
                        },
                        child: Text(_question.answers[index]),
                      ));
                })),
      ],
    );
  }
}

class OpenQuestionWidget extends StatefulWidget {
  final Question _question;
  final _QuestionnaireScaffoldState _questionnaireScaffoldState;
  OpenQuestionWidget(this._question, this._questionnaireScaffoldState);
  @override
  _OpenQuestionWidgetState createState() =>
      _OpenQuestionWidgetState(_question, _questionnaireScaffoldState);
}

class _OpenQuestionWidgetState extends State<OpenQuestionWidget> {
  final textController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final Question _question;
  final _QuestionnaireScaffoldState _questionnaireScaffoldState;
  _OpenQuestionWidgetState(this._question, this._questionnaireScaffoldState);
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
                _questionnaireScaffoldState.processAnswer(textController.text);
              }
            },
            child: Text('Login'),
          )
        ]));
  }
}
