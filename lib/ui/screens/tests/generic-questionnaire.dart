import 'dart:convert';

import 'package:Eutychia/models/generic-question.dart';
import 'package:Eutychia/models/generic-questionnaire.dart';
import 'package:Eutychia/models/equestion-type.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../common-questionnaire-views.dart';

class GenericQuestionnaireWidget extends StatefulWidget {
  @override
  QuestionnaireScaffoldState createState() => QuestionnaireScaffoldState();
}

class QuestionnaireScaffoldState extends State<GenericQuestionnaireWidget> {
  String _appBarTitle = 'Waiting';
  List<String> _answers = List<String>();
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_appBarTitle)),
      body: FutureBuilder<GenericQuestionnaire>(
          future: parseJson(),
          builder: (context, AsyncSnapshot<GenericQuestionnaire> snapshot) {
            if (snapshot.hasData) {
              WidgetsBinding.instance.addPostFrameCallback(
                  (_) => updateBarTitle(snapshot.data.title));
              return CarouselSlider(
                  items: List.generate(
                      snapshot.data.questions.length + 2,
                      (index) =>
                          questionToDisplay(snapshot.data.questions, index)),
                  carouselController: buttonCarouselController,
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

  Future<GenericQuestionnaire> parseJson() async {
    String jsonString =
        await rootBundle.loadString('assets/questionnaires/PHQ-9.json');
    final jsonResponse = jsonDecode(jsonString);
    return GenericQuestionnaire.fromJson(jsonResponse);
  }

  void updateBarTitle(String title) {
    setState(() {
      _appBarTitle = title;
    });
  }

  void nextQuestionClicked([String answer = ""]) {
    setState(() {
      if (answer.isNotEmpty) {
        _answers.add(answer);
      }
    });
    buttonCarouselController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  Widget questionToDisplay(List<GenericQuestion> questions, int index) {
    if (index == 0) {
      return QuestionDescription(nextQuestionClicked);
    } else if (index == questions.length + 1) {
      return EndOfQuestionnaireNoAnswers();
    } else {
      return questionnaireSelected(questions[index - 1]);
    }
  }

  Widget questionnaireSelected(GenericQuestion question) {
    switch (question.questionType) {
      case QuestionType.multipleChoice:
        return MultipleChoiceWidget(question, nextQuestionClicked);
      case QuestionType.openQuestion:
        return OpenQuestionWidget(question, nextQuestionClicked);
      case QuestionType.slider:
        return SliderQuestionWidget(question, nextQuestionClicked);
      default:
        throw Error();
    }
  }
}

/*class EndOfQuestionnaireWidget extends StatelessWidget {
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
}*/

class MultipleChoiceWidget extends StatelessWidget {
  final GenericQuestion _question;
  final ValueSetter<String> _nextQuestionClicked;
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

class OpenQuestionWidget extends StatefulWidget {
  final GenericQuestion _question;
  final ValueSetter<String> _nextQuestionClicked;

  OpenQuestionWidget(this._question, this._nextQuestionClicked);
  @override
  OpenQuestionWidgetState createState() =>
      OpenQuestionWidgetState(_question, _nextQuestionClicked);
}

class OpenQuestionWidgetState extends State<OpenQuestionWidget> {
  final textController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final GenericQuestion _question;
  final ValueSetter<String> _nextQuestionClicked;

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
                _nextQuestionClicked(textController.text);
              }
            },
            child: Text('Next'),
          )
        ]));
  }
}

class SliderQuestionWidget extends StatefulWidget {
  final GenericQuestion _question;
  final ValueSetter<String> _nextQuestionClicked;

  SliderQuestionWidget(this._question, this._nextQuestionClicked);
  @override
  SliderQuestionWidgetState createState() =>
      SliderQuestionWidgetState(_question, _nextQuestionClicked);
}

class SliderQuestionWidgetState extends State<SliderQuestionWidget> {
  int _currentSliderValue = 0;
  final GenericQuestion _question;
  final ValueSetter<String> _nextQuestionClicked;

  SliderQuestionWidgetState(this._question, this._nextQuestionClicked);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(_question.question),
      Row(
        children: [
          Text(_question.answers[0]),
          Expanded(
              child: Slider(
                  value: _currentSliderValue.toDouble(),
                  min: 0,
                  max: (_question.answers.length - 1).toDouble(),
                  divisions: _question.answers.length,
                  label: _question.answers[_currentSliderValue],
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value.toInt();
                    });
                  })),
          Text(_question.answers[_question.answers.length - 1]),
        ],
      ),
      ElevatedButton(
          onPressed: () =>
              _nextQuestionClicked(_question.answers[_currentSliderValue]),
          child: Text('Next'))
    ]);
  }
}
