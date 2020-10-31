import 'package:flutter/material.dart';

class StroopTestDirectionWidget extends StatefulWidget {
  @override
  StroopTestDirectionWidgetState createState() =>
      StroopTestDirectionWidgetState();
}

class StroopTestDirectionWidgetState extends State<StroopTestDirectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Stroop test")), body: Text("ABC"));
  }
}
