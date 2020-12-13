import 'package:Eutychia/models/new/project.dart';
import 'package:Eutychia/ui/screens/progress_bar_indicator.dart';
import 'package:Eutychia/viewmodels/project_overview_viewmodel.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'test_overview.dart';

class ProjectOverviewWidget extends StatelessWidget {
  static const routeName = '/projectoverview';

  final ProjectOverviewViewmodel _projectOverviewViewmodel;

  ProjectOverviewWidget(this._projectOverviewViewmodel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Choose the project'),
        ),
        body: FutureBuilder<Either<dynamic, List<Project>>>(
            future: _projectOverviewViewmodel.getTestsOfProject(),
            builder: (context,
                AsyncSnapshot<Either<dynamic, List<Project>>> snapshot) {
              if (snapshot.hasData) {
                return snapshot.data.fold(
                    (l) => Text("Couldn't collect the data"),
                    (r) => displayProjects(r, context));
              } else {
                return progressBarIndicator();
              }
            }));
  }

  GridView displayProjects(List<Project> projects, BuildContext context) {
    _projectOverviewViewmodel.updateProjects(projects);

    return GridView.count(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(20),
        childAspectRatio: 6,
        mainAxisSpacing: 10,
        crossAxisCount: 1,
        children: List.generate(projects.length, (index) {
          return ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, TestOverviewWidget.routeName,
                  arguments: projects[index]);
            },
            child: Text(projects[index].projectName),
          );
        }));
  }
}
