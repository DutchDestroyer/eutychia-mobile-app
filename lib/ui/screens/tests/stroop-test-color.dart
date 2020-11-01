import 'dart:convert';

import 'package:Eutychia/models/estroop-color-type.dart';
import 'package:Eutychia/models/stroop-test-color-task.dart';
import 'package:Eutychia/models/stroop-test-color.dart';
import 'package:Eutychia/utils/hexcolor.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import '../common-questionnaire-views.dart';

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
                return Text('waiting');
              }
            }));
  }

  void nextQuestionClicked([List<bool> answer]) {
    setState(() {
      if (answer.isNotEmpty) _answers.add(answer);
    });
    buttonCarouselController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  Widget partOfQuestionnaireToDisplay(
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

class StroopTestColorTaskWidget extends StatefulWidget {
  final ValueSetter<List<bool>> _nextQuestionClicked;
  final StroopTestColorTask _task;

  StroopTestColorTaskWidget(this._nextQuestionClicked, this._task);

  @override
  StroopTestColorTaskWidgetState createState() =>
      StroopTestColorTaskWidgetState(_nextQuestionClicked, _task);
}

class StroopTestColorTaskWidgetState extends State<StroopTestColorTaskWidget> {
  final ValueSetter<List<bool>> _nextQuestionClicked;
  final StroopTestColorTask _task;
  List<int> _buttonsClicked;

  StroopTestColorTaskWidgetState(this._nextQuestionClicked, this._task);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 2,
                scrollDirection: Axis.vertical,
                crossAxisCount: 3,
                children: List.generate(_task.objects.length, (index) {
                  return ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.white),
                      ),
                      onPressed: () => _buttonsClicked.add(index),
                      child: Text(
                        _task.objects[index].text
                            .toString()
                            .split('.')
                            .elementAt(1),
                        style: TextStyle(
                            color:
                                createRandomColor(_task.objects[index].color),
                            fontSize: 24),
                      ));
                }))),
        ElevatedButton(
          onPressed: () => onFinishButtonPress,
          child: Text('Finish'),
        )
      ],
    );
  }

  void onFinishButtonPress() {
    var answers = checkAnswers();
    _nextQuestionClicked(answers);
  }

  List<bool> checkAnswers() {
    List<bool> _checkedAnswers = List<bool>();

    for (int i = 0; i < _task.objects.length; i++) {
      if ((_task.objects[i].color == _task.colorOfWord &&
              _buttonsClicked.contains(i)) ||
          (_task.objects[i].color != _task.colorOfWord &&
              !_buttonsClicked.contains(i))) {
        _checkedAnswers.add(true);
      } else {
        _checkedAnswers.add(false);
      }
    }
    return _checkedAnswers;
  }

  Color createRandomColor(StroopColorType colorType) {
    switch (colorType) {
      case StroopColorType.Blue:
        return HexColor("0000FF");
      case StroopColorType.Red:
        return HexColor("FF0000");
      case StroopColorType.Green:
        return HexColor("00FF00");
      case StroopColorType.Purple:
        return HexColor("FF00CC");
      case StroopColorType.Orange:
        return HexColor("FFBB00");
      default:
        throw Error();
    }
  }
}
