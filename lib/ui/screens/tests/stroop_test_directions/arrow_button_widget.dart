import 'package:Eutychia/models/answers/stroop_test_direction_answer.dart';
import 'package:Eutychia/models/questionnaires/estroop_direction_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dart:math' as math;

class ArrowButton extends StatelessWidget {
  final StroopDirectionType _directionType;
  final Function _nextQuestionClicked;
  ArrowButton(this._directionType, this._nextQuestionClicked);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Ink(
            decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
            child: Transform.rotate(
                angle: setAngle(),
                child: IconButton(
                  icon: Icon(Icons.arrow_upward),
                  onPressed: () => _nextQuestionClicked(
                      StroopTestDirectionAnswer(_directionType)),
                ))));
  }

  double setAngle() {
    switch (_directionType) {
      case (StroopDirectionType.top):
        return 0 * math.pi / 180;
      case (StroopDirectionType.left):
        return 270 * math.pi / 180;
      case (StroopDirectionType.right):
        return 90 * math.pi / 180;
      case (StroopDirectionType.bottom):
        return 180 * math.pi / 180;
      default:
        throw Error();
    }
  }
}
