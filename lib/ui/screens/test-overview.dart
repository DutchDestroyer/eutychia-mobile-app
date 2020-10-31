import 'package:Eutychia/models/equestionnaire-type.dart';
import 'package:Eutychia/ui/screens/tests/stroop-test-directions.dart';
import 'package:Eutychia/ui/screens/tests/stroop-test-color.dart';
import 'package:flutter/material.dart';

import 'package:Eutychia/ui/screens/tests/generic-questionnaire.dart';

class TestOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Choose test to perform'),
        ),
        body: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            childAspectRatio: 2,
            scrollDirection: Axis.vertical,
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
                    .elementAt(1)
                    .toString()),
              );
            })));
  }
}

Widget classSelector(QuestionnaireType questionnaireTitle) {
  switch (questionnaireTitle) {
    case QuestionnaireType.questionnaire1:
      return GenericQuestionnaireWidget();
    case QuestionnaireType.stroopTestColor:
      return StroopTestColorWidget();
    case QuestionnaireType.stroopTestDirection:
      return StroopTestDirectionWidget();
    default:
      //TODO add a default here
      return null;
  }
}
