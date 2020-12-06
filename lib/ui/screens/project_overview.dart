import 'package:Eutychia/models/new/app_account.dart';
import 'package:Eutychia/models/new/project.dart';
import 'package:Eutychia/ui/screens/progress_bar_indicator.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class ProjectOverview extends StatelessWidget {
  final AppAccount _appAccount;

  ProjectOverview(this._appAccount);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Choose the project'),
        ),
        body: FutureBuilder<Either<Exception, List<Project>>>(
            future: _appAccount.projectService
                .getTestsOfProject(_appAccount.loginData.accountId),
            builder: (context,
                AsyncSnapshot<Either<Exception, List<Project>>> snapshot) {
              if (snapshot.hasData) {
                return snapshot.data.fold(
                    (l) => Text("Couldn't collect the data"),
                    (r) => GridView.count(
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.all(20),
                        childAspectRatio: 6,
                        mainAxisSpacing: 10,
                        crossAxisCount: 1,
                        children: List.generate(r.length, (index) {
                          return ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/testoverview');
                            },
                            child: Text(r[index].projectName),
                          );
                        })));
              } else {
                return progressBarIndicator();
              }
            }));
  }
}
