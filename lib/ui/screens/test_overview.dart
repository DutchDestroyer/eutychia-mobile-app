import 'package:Eutychia/models/new/project.dart';
import 'package:Eutychia/models/questionnaires/equestionnaire_type.dart';
import 'package:flutter/material.dart';

import 'tests/generic_questionnaire/generic_questionnaire_widget.dart';
import 'tests/stroop_test_color/stroop_test_color_widget.dart';
import 'tests/stroop_test_directions/stroop_test_directions_widget.dart';

class TestOverviewWidget extends StatelessWidget {
  static const routeName = '/testoverview';

  @override
  Widget build(BuildContext context) {
    final Project project = ModalRoute.of(context).settings.arguments;

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
                  Navigator.pushNamed(
                      context, testFactory(QuestionnaireType.values[index]));
                },
                child: Text(QuestionnaireType.values[index]
                    .toString()
                    .split('.')
                    .elementAt(1)),
              );
            })));
  }

  String testFactory(QuestionnaireType questionnaireTitle) {
    switch (questionnaireTitle) {
      case QuestionnaireType.phq9:
        return GenericQuestionnaireWidget.routeName;
      case QuestionnaireType.stroopTestColor:
        return StroopTestColorWidget.routename;
      case QuestionnaireType.stroopTestDirection:
        return StroopTestDirectionWidget.routename;
      default:
        throw Error();
    }
  }
}
