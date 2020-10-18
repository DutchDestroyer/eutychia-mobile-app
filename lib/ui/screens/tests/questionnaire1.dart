import 'dart:convert';

import 'package:Eutychia/models/Question.dart';
import 'package:Eutychia/models/Questionnaire.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:carousel_slider/carousel_slider.dart';

class Questionnaire1 extends StatefulWidget {
  @override
  _QuestionnaireScaffoldState createState() => _QuestionnaireScaffoldState();
}

class _QuestionnaireScaffoldState extends State<Questionnaire1> {
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
                  itemCount: snapshot.data.numberOfQuestions + 1,
                  carouselController: buttonCarouselController,
                  itemBuilder: (BuildContext context, int itemIndex) =>
                      Container(
                        child: questionToDisplay(
                            itemIndex, snapshot.data.questions, _answers, this),
                      ),
                  options: CarouselOptions(
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

  void updateBarTitle(String title) {
    setState(() {
      _appBarTitle = title;
    });
  }

  void updateAnswers(String answer) {
    setState(() {
      _answers.add(answer);
    });
  }
}

StatelessWidget questionToDisplay(int carousselIndex, List<Question> question,
    List<String> answers, _QuestionnaireScaffoldState scaffold) {
  if (carousselIndex < question.length) {
    return QuestionnaireWidget(question[carousselIndex], scaffold);
  } else {
    return EndOfQuestionnaireWidget(answers);
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
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _questionnaireScaffoldState
                          .updateAnswers((index + 1).toString());
                      _questionnaireScaffoldState.buttonCarouselController
                          .nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.linear);
                    },
                    child: Text(_question.answers[index]),
                  ));
            }),
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
