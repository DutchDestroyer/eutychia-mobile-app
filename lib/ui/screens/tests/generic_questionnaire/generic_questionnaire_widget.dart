import 'dart:convert';

import 'package:Eutychia/models/generic_question.dart';
import 'package:Eutychia/models/generic_questionnaire.dart';
import 'package:Eutychia/models/equestion_type.dart';
import 'package:Eutychia/ui/screens/tests/generic_questionnaire/slider_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../../common_questionnaire_views.dart';
import 'multiple_choice_widget.dart';
import 'open_question_widget.dart';

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
                          questionToDisplayFactory(snapshot.data.questions, index)),
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

  Widget questionToDisplayFactory(List<GenericQuestion> questions, int index) {
    if (index == 0) {
      return QuestionDescription(nextQuestionClicked);
    } else if (index == questions.length + 1) {
      return EndOfQuestionnaireNoAnswers();
    } else {
      return questionnaireWidgetFactory(questions[index - 1]);
    }
  }

  Widget questionnaireWidgetFactory(GenericQuestion question) {
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
