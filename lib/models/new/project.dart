import 'package:Eutychia/models/new/test.dart';

class Project {
  final String projectID;
  final String projectName;

  List<Test> _tests;
  List<Test> get tests => _tests;
  Project(this.projectID, this.projectName);

  void updateTests(List<Test> tests) {
    _tests = tests;
  }
}
