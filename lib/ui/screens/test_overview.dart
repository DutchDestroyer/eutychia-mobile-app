import 'package:Eutychia/models/equestionnaire_type.dart';
import 'package:Eutychia/ui/screens/tests/stroop_test_directions/stroop_test_directions_widget.dart';
import 'package:Eutychia/ui/screens/tests/stroop_test_color/stroop_test_color_widget.dart';
import 'package:flutter/material.dart';

import 'package:Eutychia/ui/screens/tests/generic_questionnaire/generic_questionnaire_widget.dart';

class TestOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Choose test to perform'),
        ),
        body: GridView.count(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(20),
            childAspectRatio: 6,
            mainAxisSpacing: 10,
            crossAxisCount: 1,
            children: List.generate(QuestionnaireType.values.length, (index) {
              return ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              classSelector(QuestionnaireType.values[index])));
                },
                child: Text(QuestionnaireType.values[index]
                    .toString()
                    .split('.')
                    .elementAt(1)),
              );
            })));
  }
}

Widget classSelector(QuestionnaireType questionnaireTitle) {
  switch (questionnaireTitle) {
    case QuestionnaireType.phq9:
      return GenericQuestionnaireWidget();
    case QuestionnaireType.stroopTestColor:
      return StroopTestColorWidget();
    case QuestionnaireType.stroopTestDirection:
      return StroopTestDirectionWidget();
    default:
      throw Error();
  }
}
