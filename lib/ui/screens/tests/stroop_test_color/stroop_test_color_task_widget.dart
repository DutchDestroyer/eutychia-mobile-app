import 'dart:ui';

import 'package:Eutychia/models/answers/stroop_test_color_answer.dart';
import 'package:Eutychia/models/questionnaires/estroop_color_type.dart';
import 'package:Eutychia/models/questionnaires/stroop_test_color_task.dart';
import 'package:Eutychia/utils/hexcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StroopTestColorTaskWidget extends StatefulWidget {
  final Function _nextQuestionClicked;
  final StroopTestColorTask _task;

  StroopTestColorTaskWidget(this._nextQuestionClicked, this._task);

  @override
  StroopTestColorTaskWidgetState createState() =>
      StroopTestColorTaskWidgetState(_nextQuestionClicked, _task);
}

class StroopTestColorTaskWidgetState extends State<StroopTestColorTaskWidget> {
  final Function _nextQuestionClicked;
  final StroopTestColorTask _task;
  List<int> _buttonsClicked = List<int>();

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
                      style: ButtonStyle(backgroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.blue;
                        } else if (states.contains(MaterialState.disabled)) {
                          return Colors.grey;
                        } else {
                          return Colors.white;
                        }
                      })),
                      onPressed: _buttonsClicked.contains(index)
                          ? null
                          : () => onButtonClick(index),
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
          onPressed: () => {_nextQuestionClicked(checkAnswers())},
          child: Text('Finish'),
        )
      ],
    );
  }

  void onButtonClick(int index) {
    setState(() {
      _buttonsClicked.add(index);
    });
  }

  StroopTestColorAnswer checkAnswers() {
    int _clickedCorrectly = 0;
    int _clickedIncorrectly = 0;
    int _notclickedCorrectly = 0;
    int _notClickedIncorrectly = 0;

    for (int i = 0; i < _task.objects.length; i++) {
      if (_task.objects[i].color == _task.colorOfWord &&
          _buttonsClicked.contains(i)) {
        _clickedCorrectly++;
      } else if (_task.objects[i].color != _task.colorOfWord &&
          !_buttonsClicked.contains(i)) {
        _notclickedCorrectly++;
      } else if (_task.objects[i].color == _task.colorOfWord &&
          !_buttonsClicked.contains(i)) {
        _notClickedIncorrectly++;
      } else {
        _clickedIncorrectly++;
      }
    }
    return StroopTestColorAnswer(_clickedCorrectly, _clickedIncorrectly,
        _notclickedCorrectly, _notClickedIncorrectly);
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
