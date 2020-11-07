import 'package:Eutychia/models/questionnaires/stroop_test_direction_object.dart';
import 'package:flutter/cupertino.dart';

class SquareText extends StatelessWidget {
  final StroopTestDirectionObject _task;
  SquareText(this._task);
  @override
  Widget build(BuildContext context) {
    return Text(_task.text.toString().split('.').elementAt(1),
        style: TextStyle(fontSize: 18));
  }
}