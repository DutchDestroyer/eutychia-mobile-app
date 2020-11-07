import 'dart:convert';

import 'package:Eutychia/models/questionnaires/generic_questionnaire.dart';
import 'package:Eutychia/ui/screens/tests/display_factory.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../base_questionnaire_widget.dart';

class GenericQuestionnaireWidget extends StatefulWidget {
  final DisplayFactory _displayFactory;
  GenericQuestionnaireWidget(this._displayFactory);

  @override
  GenericQuestionnaireWidgetState createState() =>
      GenericQuestionnaireWidgetState(_displayFactory);
}

class GenericQuestionnaireWidgetState extends BaseQuestionnaireWidget {
  final DisplayFactory _displayFactory;

  List<String> _answers = List<String>();

  GenericQuestionnaireWidgetState(this._displayFactory);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
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
                          _displayFactory.partOfQuestionnaireToDisplayFactory(
                              index,
                              snapshot.data.questions,
                              nextQuestionClicked,
                              snapshot.data.description,
                              snapshot.data.finalRemark,
                              snapshot.data.displayAnswers)),
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

  void nextQuestionClicked([String answer = ""]) {
    setState(() {
      if (answer.isNotEmpty) {
        _answers.add(answer);
      }
    });
    buttonCarouselController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.linear);
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
