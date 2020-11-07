import 'dart:convert';

import 'package:Eutychia/models/stroop_test_direction_object.dart';
import 'package:Eutychia/models/stroop_test_direction.dart';
import 'package:Eutychia/ui/screens/common_questionnaire_views.dart';
import 'package:Eutychia/ui/screens/tests/stroop_test_directions/stroop_test_direction_task_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class StroopTestDirectionWidget extends StatefulWidget {
  @override
  StroopTestDirectionWidgetState createState() =>
      StroopTestDirectionWidgetState();
}

class StroopTestDirectionWidgetState extends State<StroopTestDirectionWidget> {
  CarouselController buttonCarouselController = CarouselController();
  List<String> _answers = List<String>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Stroop test direction")),
        body: FutureBuilder<StroopTestDirection>(
            future: parseJson(),
            builder: (context, AsyncSnapshot<StroopTestDirection> snapshot) {
              if (snapshot.hasData) {
                return CarouselSlider(
                    items: List.generate(
                        snapshot.data.tasks.length + 2,
                        (index) => partOfQuestionnaireToDisplayFactory(
                            index, snapshot.data.tasks)),
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

  Widget partOfQuestionnaireToDisplayFactory(
      int index, List<StroopTestDirectionObject> tasks) {
    if (index == 0) {
      return QuestionDescription(nextQuestionClicked);
    } else if (index == tasks.length + 1) {
      return EndOfQuestionnaireNoAnswers();
    } else {
      return StroopTestDirectionTaskWidget(
          nextQuestionClicked, tasks[index - 1]);
    }
  }
}
