import 'package:Eutychia/models/answers/generic_questionnaire_answer.dart';
import 'package:Eutychia/models/answers/generic_questionnaire_answers.dart';
import 'package:flutter/cupertino.dart';

class GenericQuestionnaireEndView extends StatelessWidget {
  final GenericQuestionnaireAnswers<GenericQuestionnaireAnswer> _answers;
  GenericQuestionnaireEndView(this._answers);
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
                  "question ${index + 1}: answer: ${_answers.answers[index].answer}, time ${_answers.answers[index].time}");
            })
      ],
    );
  }
}
