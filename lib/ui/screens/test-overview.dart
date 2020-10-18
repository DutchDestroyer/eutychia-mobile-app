import 'package:Eutychia/ui/screens/tests/generic-questionnaire.dart';
import 'package:flutter/material.dart';

class TestOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Choose test to perform'),
        ),
        body: Column(children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => GenericQuestionnaire()));
            },
            child: Text('Test 1'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => TestOverview()));
            },
            child: Text('Test 2'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => TestOverview()));
            },
            child: Text('Test 3'),
          ),
        ]));
  }
}
