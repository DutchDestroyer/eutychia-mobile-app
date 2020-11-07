import 'package:Eutychia/models/questionnaires/equestionnaire_type.dart';
import 'package:Eutychia/models/questionnaires/generic_question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderQuestionWidget extends StatefulWidget {
  final GenericQuestion _question;
  final Function _nextQuestionClicked;
  final QuestionnaireType _questionnaireType;

  SliderQuestionWidget(
      this._question, this._nextQuestionClicked, this._questionnaireType);
  @override
  SliderQuestionWidgetState createState() => SliderQuestionWidgetState(
      _question, _nextQuestionClicked, _questionnaireType);
}

class SliderQuestionWidgetState extends State<SliderQuestionWidget> {
  int _currentSliderValue = 0;
  final GenericQuestion _question;
  final Function _nextQuestionClicked;
  final QuestionnaireType _questionnaireType;

  SliderQuestionWidgetState(
      this._question, this._nextQuestionClicked, this._questionnaireType);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(_question.question),
      Row(
        children: [
          Text(_question.answers[0]),
          Expanded(
              child: Slider(
                  value: _currentSliderValue.toDouble(),
                  min: 0,
                  max: (_question.answers.length - 1).toDouble(),
                  divisions: _question.answers.length - 1,
                  label: _question.answers[_currentSliderValue],
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value.toInt();
                    });
                  })),
          Text(_question.answers[_question.answers.length - 1]),
        ],
      ),
      ElevatedButton(
          onPressed: () => _nextQuestionClicked(
              _questionnaireType, _question.answers[_currentSliderValue]),
          child: Text('Next'))
    ]);
  }
}
