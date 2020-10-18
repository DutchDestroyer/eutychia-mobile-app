import 'dart:convert';

import 'package:Eutychia/models/equestionnaire-type.dart';
import 'package:Eutychia/ui/screens/tests/stroop-test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:Eutychia/ui/screens/tests/generic-questionnaire.dart';
import 'package:Eutychia/models/questionnaires-list.dart';

class TestOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Choose test to perform'),
        ),
        body: FutureBuilder<QuestionnairesList>(
            future: parseJson(),
            builder: (context, AsyncSnapshot<QuestionnairesList> snapshot) {
              if (snapshot.hasData) {
                return GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: 2,
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 1,
                    children: List.generate(
                        snapshot.data.questionnaireTitles.length, (index) {
                      return ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => classSelector(snapshot
                                      .data.questionnaireTitles[index])));
                        },
                        child: Text(snapshot.data.questionnaireTitles[index]
                            .toString()),
                      );
                    }));
              } else {
                return Text('Waiting');
              }
            }));
  }

  Future<QuestionnairesList> parseJson() async {
    String jsonString = await rootBundle
        .loadString('assets/questionnaires/list-of-questionnaires.json');
    final jsonResponse = jsonDecode(jsonString);
    return QuestionnairesList.fromJson(jsonResponse);
  }

  Widget classSelector(QuestionnaireType questionnaireTitle) {
    switch (questionnaireTitle) {
      case QuestionnaireType.questionnaire1:
        return GenericQuestionnaireWidget();
      case QuestionnaireType.stroopTest:
        return StroopTestWidget();
      default:
        //TODO add a default here
        return null;
    }
  }
}
