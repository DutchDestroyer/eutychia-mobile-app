import 'dart:convert';
import 'dart:math';

import 'package:Eutychia/models/stroop-test.dart';
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
  final int _wordsToShow = 21;
  final _random = new Random();

  StroopTestColorWidgetState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Stroop test color")),
        body: FutureBuilder<StroopTest>(
            future: parseJson(),
            builder: (context, AsyncSnapshot<StroopTest> snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Expanded(
                        child: GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            childAspectRatio: 2,
                            scrollDirection: Axis.vertical,
                            crossAxisCount: 3,
                            children: List.generate(_wordsToShow, (index) {
                              return ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith(
                                            (states) => Colors.white),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    createRandomWords(snapshot.data.words),
                                    style: TextStyle(
                                        color: createRandomColor(
                                            snapshot.data.colors),
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

  String createRandomWords(List<String> words) {
    return words[_random.nextInt(words.length)];
  }

  Color createRandomColor(List<String> colors) {
    return HexColor(colors[_random.nextInt(colors.length)]);
  }

  Future<StroopTest> parseJson() async {
    String jsonString =
        await rootBundle.loadString('assets/resources/stroop-test-data.json');
    final jsonResponse = jsonDecode(jsonString);
    return StroopTest.fromJson(jsonResponse);
  }
}
