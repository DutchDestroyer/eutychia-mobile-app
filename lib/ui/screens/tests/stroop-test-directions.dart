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
                return CarouselSlider(
                    items: List.generate(
                        snapshot.data.tasks.length + 2,
                        (index) => partOfQuestionnaireToDisplay(
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
      return StroopTestDirectionTaskWidget(
          nextQuestionClicked, tasks[index - 1]);
    }
  }
}

class StroopTestDirectionTaskWidget extends StatelessWidget {
  final ValueSetter<String> _nextQuestionClicked;
  final StroopTestDirectionObject _task;

  StroopTestDirectionTaskWidget(this._nextQuestionClicked, this._task);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Ink(
          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          height: (MediaQuery.of(context).size.height / 2),
          width: (MediaQuery.of(context).size.height / 2),
          child: SquareTask(_task)),
      Ink(
          decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
          child: ArrowButton(StroopDirectionType.top, _nextQuestionClicked)),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Ink(
              decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
              child: Transform.rotate(
                  angle: 270 * math.pi / 180,
                  child: ArrowButton(
                      StroopDirectionType.left, _nextQuestionClicked))),
          Ink(
              decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
              child: Transform.rotate(
                  angle: 90 * math.pi / 180,
                  child: ArrowButton(
                      StroopDirectionType.right, _nextQuestionClicked))),
        ],
      ),
      Ink(
          decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
          child: ArrowButton(StroopDirectionType.bottom, _nextQuestionClicked))
    ]);
  }
}

class SquareTask extends StatelessWidget {
  final StroopTestDirectionObject _task;
  SquareTask(this._task);
  @override
  Widget build(BuildContext context) {
    switch (_task.direction) {
      case (StroopDirectionType.top):
        return Align(alignment: Alignment.topCenter, child: SquareText(_task));
      case (StroopDirectionType.left):
        return Align(alignment: Alignment.centerLeft, child: SquareText(_task));
      case (StroopDirectionType.right):
        return Align(
            alignment: Alignment.centerRight, child: SquareText(_task));
      case (StroopDirectionType.bottom):
        return Align(
            alignment: Alignment.bottomCenter, child: SquareText(_task));
      default:
        throw Error();
    }
  }
}

class SquareText extends StatelessWidget {
  final StroopTestDirectionObject _task;
  SquareText(this._task);
  @override
  Widget build(BuildContext context) {
    return Text(_task.text.toString().split('.').elementAt(1));
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
