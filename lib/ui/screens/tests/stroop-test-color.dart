import 'dart:convert';
import 'dart:math';

import 'package:Eutychia/models/estroop-color-type.dart';
import 'package:Eutychia/models/stroop-test-color.dart';
import 'package:Eutychia/utils/hexcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class StroopTestColorWidget extends StatefulWidget {
  @override
  StroopTestColorWidgetState createState() => StroopTestColorWidgetState();
}

class StroopTestColorWidgetState extends State<StroopTestColorWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Stroop test color")),
        body: FutureBuilder<StroopTestColor>(
            future: parseJson(),
            builder: (context, AsyncSnapshot<StroopTestColor> snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Expanded(
                        child: GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            childAspectRatio: 2,
                            scrollDirection: Axis.vertical,
                            crossAxisCount: 3,
                            children: List.generate(snapshot.data.tasks.length,
                                (index) {
                              return ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) => Colors.white),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    snapshot.data.tasks[index].text
                                        .toString()
                                        .split('.')
                                        .elementAt(1),
                                    style: TextStyle(
                                        color: createRandomColor(
                                            snapshot.data.tasks[index].color),
                                        fontSize: 24),
                                  ));
                            }))),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Finish'),
                    )
                  ],
                );
              } else {
                return Text('waiting');
              }
            }));
  }

  Color createRandomColor(StroopColorType colorType) {
    switch (colorType) {
      case StroopColorType.Blue:
        return HexColor("0000FF");
      case StroopColorType.Red:
        return HexColor("FF0000");
      case StroopColorType.Green:
        return HexColor("00FF00");
      case StroopColorType.Purple:
        return HexColor("FF00CC");
      case StroopColorType.Orange:
        return HexColor("FFBB00");
    }
  }

  Future<StroopTestColor> parseJson() async {
    String jsonString = await rootBundle
        .loadString('assets/resources/stroop-test-color-data.json');
    final jsonResponse = jsonDecode(jsonString);
    return StroopTestColor.fromJson(jsonResponse);
  }
}
