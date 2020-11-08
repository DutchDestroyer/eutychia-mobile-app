import 'package:Eutychia/models/answers/stroop_test_direction_answer.dart';
import 'package:Eutychia/models/answers/stroop_test_direction_answers.dart';
import 'package:flutter/cupertino.dart';

class StroopTestDirectionEndView extends StatelessWidget {
  final StroopTestDirectionAnswers<StroopTestDirectionAnswer> _answers;
  StroopTestDirectionEndView(this._answers);
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
                  "view ${index + 1}: answer given: ${_answers.answers[index].givenAnswer}, correct answer: ${_answers.answers[index].correctAnswer}, time ${_answers.answers[index].time}");
            })
      ],
    );
  }
}
