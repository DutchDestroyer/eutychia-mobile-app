import 'package:Eutychia/models/estroop_direction_type.dart';
import 'package:Eutychia/models/stroop_test_direction_object.dart';
import 'package:Eutychia/ui/screens/tests/stroop_test_directions/square_text_widget.dart';
import 'package:flutter/cupertino.dart';

class SquareTaskWidget extends StatelessWidget {
  final StroopTestDirectionObject _task;
  SquareTaskWidget(this._task);
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
