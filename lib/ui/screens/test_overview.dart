import 'package:Eutychia/models/new/project.dart';
import 'package:Eutychia/models/new/test.dart';
import 'package:Eutychia/models/questionnaires/equestionnaire_type.dart';
import 'package:Eutychia/models/new/test_project_ID.dart';
import 'package:Eutychia/ui/screens/progress_bar_indicator.dart';
import 'package:Eutychia/viewmodels/test_overview_viewmodel.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter/material.dart';

import 'tests/generic_questionnaire/generic_questionnaire_widget.dart';
import 'tests/stroop_test_color/stroop_test_color_widget.dart';
import 'tests/stroop_test_directions/stroop_test_directions_widget.dart';

class TestOverviewWidget extends StatelessWidget {
  static const routeName = '/testoverview';
  final TestOverviewViewmodel _testOverviewViewmodel;

  TestOverviewWidget(this._testOverviewViewmodel);

  @override
  Widget build(BuildContext context) {
    final Project project = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Choose test to perform'),
        ),
        body: FutureBuilder<Either<dynamic, List<Test>>>(
            future: _testOverviewViewmodel
                .getTestsOfProjectForAccount(project.projectID),
            builder:
                (context, AsyncSnapshot<Either<dynamic, List<Test>>> snapshot) {
              if (snapshot.hasData) {
                return snapshot.data.fold(
                    (l) => Text("couldn't collect the data"),
                    (tests) => _displayTestWidget(context, tests, project));
              } else {
                return progressBarIndicator();
              }
            }));
  }

  Widget _displayTestWidget(
      BuildContext context, List<Test> tests, Project project) {
    _testOverviewViewmodel.updateTestsOfProject(tests, project.projectID);

    return GridView.count(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(20),
        childAspectRatio: 6,
        mainAxisSpacing: 10,
        crossAxisCount: 1,
        children: List.generate(tests.length, (index) {
          return ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                  context, _testFactory(tests[index].questionnaireType),
                  arguments:
                      TestProjectID(tests[index].testID, project.projectID));
            },
            child: Text(tests[index].testName),
          );
        }));
  }

  String _testFactory(QuestionnaireType questionnaireType) {
    switch (questionnaireType) {
      case QuestionnaireType.generic:
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
