import 'dart:convert';

import 'package:Eutychia/models/stroop_test_color_task.dart';
import 'package:Eutychia/models/stroop_test_color.dart';
import 'package:Eutychia/ui/screens/tests/stroop_test_color/stroop_test_color_task_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common_questionnaire_views.dart';

class StroopTestColorWidget extends StatefulWidget {
  @override
  StroopTestColorWidgetState createState() => StroopTestColorWidgetState();
}

class StroopTestColorWidgetState extends State<StroopTestColorWidget> {
  CarouselController buttonCarouselController = CarouselController();
  List<List<bool>> _answers = List<List<bool>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Stroop test color")),
        body: FutureBuilder<StroopTestColor>(
            future: parseJson(),
            builder: (context, AsyncSnapshot<StroopTestColor> snapshot) {
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
                return Text('waiting');
              }
            }));
  }

  void nextQuestionClicked([List<bool> answer]) {
    setState(() {
      if (answer?.isNotEmpty == true) {
        _answers.add(answer);
      }
    });
    buttonCarouselController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  Widget partOfQuestionnaireToDisplayFactory(
      int index, List<StroopTestColorTask> tasks) {
    if (index == 0) {
      return QuestionDescription(nextQuestionClicked);
    } else if (index == tasks.length + 1) {
      return EndOfQuestionnaireNoAnswers();
    } else {
      return StroopTestColorTaskWidget(nextQuestionClicked, tasks[index - 1]);
    }
  }

  Future<StroopTestColor> parseJson() async {
    String jsonString = await rootBundle
        .loadString('assets/resources/stroop-test-color-data.json');
    final jsonResponse = jsonDecode(jsonString);
    return StroopTestColor.fromJson(jsonResponse);
  }
}
