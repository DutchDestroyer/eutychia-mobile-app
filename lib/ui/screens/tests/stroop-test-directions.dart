import 'dart:convert';

import 'package:Eutychia/models/stroop-test-direction.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/services.dart';

class StroopTestDirectionWidget extends StatefulWidget {
  @override
  StroopTestDirectionWidgetState createState() =>
      StroopTestDirectionWidgetState();
}

class StroopTestDirectionWidgetState extends State<StroopTestDirectionWidget> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Stroop test direction")),
        body: FutureBuilder<StroopTestDirection>(
            future: parseJson(),
            builder: (context, AsyncSnapshot<StroopTestDirection> snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    CarouselSlider.builder(
                        itemCount: snapshot.data.tasks.length,
                        carouselController: buttonCarouselController,
                        itemBuilder: (BuildContext context, int itemIndex) =>
                            Container(
                              child: Text('bla'),
                            ),
                        options: CarouselOptions(
                            height: MediaQuery.of(context).size.height,
                            initialPage: 0,
                            enableInfiniteScroll: false,
                            autoPlay: false,
                            viewportFraction: 1.0)),
                    Ink(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue)),
                        child: IconButton(
                          icon: Icon(Icons.arrow_upward),
                          onPressed: () {},
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Ink(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue)),
                            child: Transform.rotate(
                                angle: 270 * math.pi / 180,
                                child: IconButton(
                                  icon: Icon(Icons.arrow_upward),
                                  onPressed: () {},
                                ))),
                        Ink(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue)),
                            child: Transform.rotate(
                                angle: 90 * math.pi / 180,
                                child: IconButton(
                                  icon: Icon(Icons.arrow_upward),
                                  onPressed: () {},
                                ))),
                      ],
                    ),
                    Ink(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue)),
                        child: IconButton(
                          icon: Icon(Icons.arrow_downward),
                          onPressed: () {},
                        ))
                  ],
                );
              } else {
                return Text('Waiting');
              }
            }));
  }

  Future<StroopTestDirection> parseJson() async {
    String jsonString = await rootBundle
        .loadString('assets/resources/stroop-test-direction-data.json');
    final jsonResponse = jsonDecode(jsonString);
    return StroopTestDirection.fromJson(jsonResponse);
  }
}
