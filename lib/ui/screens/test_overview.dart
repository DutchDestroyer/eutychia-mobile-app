import 'package:Eutychia/models/questionnaires/equestionnaire_type.dart';
import 'package:flutter/material.dart';

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
        return '/genericquestionnaire';
      case QuestionnaireType.stroopTestColor:
        return '/strooptestcolor';
      case QuestionnaireType.stroopTestDirection:
        return '/strooptestdirections';
      default:
        throw Error();
    }
  }
}
