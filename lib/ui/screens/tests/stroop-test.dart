import 'dart:convert';
import 'dart:math';

import 'package:Eutychia/models/stroop-test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class StroopTestWidget extends StatefulWidget {
  @override
  StroopTestWidgetState createState() => StroopTestWidgetState();
}

class StroopTestWidgetState extends State<StroopTestWidget> {
  final int _wordsToShow = 24;
  final _random = new Random();

  StroopTestWidgetState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Stroop test")),
        body: FutureBuilder<StroopTest>(
            future: parseJson(),
            builder: (context, AsyncSnapshot<StroopTest> snapshot) {
              if (snapshot.hasData) {
                return GridView.count(
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 3,
                    children: List.generate(_wordsToShow, (index) {
                      return ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            createRandomWords(snapshot.data.words),
                            style: TextStyle(
                                color: createRandomColor(snapshot.data.colors),
                                fontSize: 24),
                          ));
                    }));
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

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
