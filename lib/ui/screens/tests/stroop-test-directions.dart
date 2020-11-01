import 'dart:convert';

import 'package:Eutychia/models/estroop-direction-type.dart';
import 'package:Eutychia/models/stroop-test-direction-object.dart';
import 'package:Eutychia/models/stroop-test-direction.dart';
import 'package:Eutychia/ui/screens/common-questionnaire-views.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

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
                return Column(
                  children: [
                    CarouselSlider(
                        items: List.generate(
                            snapshot.data.tasks.length + 2,
                            (index) => partOfQuestionnaireToDisplay(
                                index, snapshot.data.tasks)),
                        carouselController: buttonCarouselController,
                        options: CarouselOptions(
                            initialPage: 0,
                            enableInfiniteScroll: false,
                            autoPlay: false,
                            viewportFraction: 1.0)),
                  ],
                );
              } else {
                return Text('Waiting');
              }
            }));
  }

  void nextQuestionClicked([String answer = ""]) {
    setState(() {
      if (answer.isNotEmpty) _answers.add(answer);
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

  Widget partOfQuestionnaireToDisplay(
      int index, List<StroopTestDirectionObject> tasks) {
    if (index == 0) {
      return QuestionDescription(nextQuestionClicked);
    } else if (index == tasks.length + 1) {
      return EndOfQuestionnaireNoAnswers();
    } else {
      return StroopTestDirectionTaskWidget(nextQuestionClicked, index - 1);
    }
  }
}

class StroopTestDirectionTaskWidget extends StatelessWidget {
  final ValueSetter<String> _nextQuestionClicked;
  final int _index;

  StroopTestDirectionTaskWidget(this._nextQuestionClicked, this._index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("task $_index"),
        Ink(
            decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
            child: ArrowButton(StroopDirectionType.top, _nextQuestionClicked)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Ink(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                child: Transform.rotate(
                    angle: 270 * math.pi / 180,
                    child: ArrowButton(
                        StroopDirectionType.left, _nextQuestionClicked))),
            Ink(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                child: Transform.rotate(
                    angle: 90 * math.pi / 180,
                    child: ArrowButton(
                        StroopDirectionType.right, _nextQuestionClicked))),
          ],
        ),
        Ink(
            decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
            child:
                ArrowButton(StroopDirectionType.bottom, _nextQuestionClicked))
      ],
    );
  }
}

class ArrowButton extends StatelessWidget {
  final StroopDirectionType directionType;
  final ValueSetter<String> nextQuestionClicked;

  ArrowButton(this.directionType, this.nextQuestionClicked);

  @override
  Widget build(BuildContext context) {
    switch (directionType) {
      case (StroopDirectionType.top):
        return IconButton(
          icon: Icon(Icons.arrow_upward),
          onPressed: () => nextQuestionClicked(directionType.toString()),
        );
      case (StroopDirectionType.left):
        return IconButton(
          icon: Icon(Icons.arrow_upward),
          onPressed: () => nextQuestionClicked(directionType.toString()),
        );
      case (StroopDirectionType.right):
        return IconButton(
          icon: Icon(Icons.arrow_upward),
          onPressed: () => nextQuestionClicked(directionType.toString()),
        );
      case (StroopDirectionType.bottom):
        return IconButton(
          icon: Icon(Icons.arrow_downward),
          onPressed: () => nextQuestionClicked(directionType.toString()),
        );
      default:
        throw Error();
    }
  }
}
