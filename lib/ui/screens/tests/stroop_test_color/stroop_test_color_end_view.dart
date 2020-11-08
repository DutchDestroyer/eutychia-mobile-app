import 'package:Eutychia/models/answers/stroop_test_color_answer.dart';
import 'package:Eutychia/models/answers/stroop_test_color_answers.dart';
import 'package:flutter/cupertino.dart';

class StroopTestColorEndView extends StatelessWidget {
  final StroopTestColorAnswers<StroopTestColorAnswer> _answers;
  StroopTestColorEndView(this._answers);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Finished, your answers are:'),
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: _answers.answers.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(
                  "view ${index + 1}: clicked correctly: ${_answers.answers[index].clickedCorrectly}, clicked incorrectly: ${_answers.answers[index].clickedIncorrectly}, not clicked correctly: ${_answers.answers[index].notClickedCorrectly}, not clicked incorrectly: ${_answers.answers[index].notClickedIncorrectly}, time ${_answers.answers[index].time}");
            })
      ],
    );
  }
}
