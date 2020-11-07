import 'dart:convert';

import 'package:Eutychia/models/questionnaires/stroop_test_direction.dart';
import 'package:Eutychia/ui/screens/tests/display_factory.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import '../base_questionnaire_widget.dart';

class StroopTestDirectionWidget extends StatefulWidget {
  final DisplayFactory _displayFactory;
  StroopTestDirectionWidget(this._displayFactory);

  @override
  StroopTestDirectionWidgetState createState() =>
      StroopTestDirectionWidgetState(_displayFactory);
}

class StroopTestDirectionWidgetState extends BaseQuestionnaireWidget {
  final DisplayFactory _displayFactory;

  List<String> _answers = List<String>();

  StroopTestDirectionWidgetState(this._displayFactory);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(appBarTitle)),
        body: FutureBuilder<StroopTestDirection>(
            future: parseJson(),
            builder: (context, AsyncSnapshot<StroopTestDirection> snapshot) {
              if (snapshot.hasData) {
                WidgetsBinding.instance.addPostFrameCallback(
                    (_) => updateBarTitle(snapshot.data.title));
                return CarouselSlider(
                    items: List.generate(
                        snapshot.data.tasks.length + 2,
                        (index) =>
                            _displayFactory.partOfQuestionnaireToDisplayFactory(
                                index,
                                snapshot.data.tasks,
                                nextQuestionClicked,
                                snapshot.data.description,
                                snapshot.data.finalRemark,
                                snapshot.data.displayAnswers)),
                    carouselController: buttonCarouselController,
                    options: CarouselOptions(
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        autoPlay: false,
                        viewportFraction: 1.0,
                        height: MediaQuery.of(context).size.height));
              } else {
                return Text('Waiting');
              }
            }));
  }

  void nextQuestionClicked([String answer = ""]) {
    setState(() {
      if (answer?.isNotEmpty == true) {
        _answers.add(answer);
      }
    });
    buttonCarouselController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  Future<StroopTestDirection> parseJson() async {
    String jsonString = await rootBundle
        .loadString('assets/resources/stroop-test-direction-data.json');
    final jsonResponse = jsonDecode(jsonString);
    return StroopTestDirection.fromJson(jsonResponse);
  }
}
