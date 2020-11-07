import 'dart:convert';

import 'package:Eutychia/models/stroop_test_color.dart';
import 'package:Eutychia/ui/screens/tests/display_factory.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StroopTestColorWidget extends StatefulWidget {
  final DisplayFactory _displayFactory;
  StroopTestColorWidget(this._displayFactory);

  @override
  StroopTestColorWidgetState createState() =>
      StroopTestColorWidgetState(_displayFactory);
}

class StroopTestColorWidgetState extends State<StroopTestColorWidget> {
  final DisplayFactory _displayFactory;

  CarouselController buttonCarouselController = CarouselController();
  List<List<bool>> _answers = List<List<bool>>();

  StroopTestColorWidgetState(this._displayFactory);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Stroop test color")),
        body: FutureBuilder<StroopTestColor>(
            future: parseJson(),
            builder: (context, AsyncSnapshot<StroopTestColor> snapshot) {
              if (snapshot.hasData) {
                return CarouselSlider(
                    items: List.generate(
                        snapshot.data.tasks.length + 2,
                        (index) =>
                            _displayFactory.partOfQuestionnaireToDisplayFactory(
                                index,
                                snapshot.data.tasks,
                                nextQuestionClicked)),
                    carouselController: buttonCarouselController,
                    options: CarouselOptions(
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        autoPlay: false,
                        viewportFraction: 1.0,
                        height: MediaQuery.of(context).size.height));
              } else {
                return Text('waiting');
              }
            }));
  }

  void nextQuestionClicked([List<bool> answer]) {
    setState(() {
      if (answer?.isNotEmpty == true) {
        _answers.add(answer);
      }
    });
    buttonCarouselController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }

  Future<StroopTestColor> parseJson() async {
    String jsonString = await rootBundle
        .loadString('assets/resources/stroop-test-color-data.json');
    final jsonResponse = jsonDecode(jsonString);
    return StroopTestColor.fromJson(jsonResponse);
  }
}
