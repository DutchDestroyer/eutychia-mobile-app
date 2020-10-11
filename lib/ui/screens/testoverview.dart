import 'package:Eutychia/ui/screens/tests/questionnaire1.dart';
import 'package:flutter/material.dart';

class TestOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Choose test to perform'),
        ),
        body: Column(children: [
          RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => Questionnaire1()));
            },
            child: Text('Test 1'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => TestOverview()));
            },
            child: Text('Test 2'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => TestOverview()));
            },
            child: Text('Test 3'),
          ),
        ]));
  }
}
