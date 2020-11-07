import 'package:Eutychia/models/estroop_direction_type.dart';
import 'package:Eutychia/models/stroop_test_direction_object.dart';
import 'package:Eutychia/ui/screens/tests/stroop_test_directions/square_task_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'arrow_button_widget.dart';

class StroopTestDirectionTaskWidget extends StatelessWidget {
  final Function _nextQuestionClicked;
  final StroopTestDirectionObject _task;

  StroopTestDirectionTaskWidget(this._nextQuestionClicked, this._task);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: const EdgeInsets.all(20),
          child: Ink(
              decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              height: (MediaQuery.of(context).size.height / 2),
              width: (MediaQuery.of(context).size.height / 2),
              child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: SquareTaskWidget(_task)))),
      ArrowButton(StroopDirectionType.top, _nextQuestionClicked),
      Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ArrowButton(StroopDirectionType.left, _nextQuestionClicked),
              ArrowButton(StroopDirectionType.right, _nextQuestionClicked),
            ],
          )),
      ArrowButton(StroopDirectionType.bottom, _nextQuestionClicked)
    ]);
  }
}
