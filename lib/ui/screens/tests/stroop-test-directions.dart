import 'package:flutter/material.dart';
import 'dart:math' as math;

class StroopTestDirectionWidget extends StatefulWidget {
  @override
  StroopTestDirectionWidgetState createState() =>
      StroopTestDirectionWidgetState();
}

class StroopTestDirectionWidgetState extends State<StroopTestDirectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Stroop test direction")),
        body: Column(
          children: [
            Ink(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                child: IconButton(
                  icon: Icon(Icons.arrow_upward),
                  onPressed: () {},
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Ink(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.blue)),
                    child: Transform.rotate(
                        angle: 270 * math.pi / 180,
                        child: IconButton(
                          icon: Icon(Icons.arrow_upward),
                          onPressed: () {},
                        ))),
                Ink(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.blue)),
                    child: Transform.rotate(
                        angle: 90 * math.pi / 180,
                        child: IconButton(
                          icon: Icon(Icons.arrow_upward),
                          onPressed: () {},
                        ))),
              ],
            ),
            Ink(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                child: IconButton(
                  icon: Icon(Icons.arrow_downward),
                  onPressed: () {},
                ))
          ],
        ));
  }
}
