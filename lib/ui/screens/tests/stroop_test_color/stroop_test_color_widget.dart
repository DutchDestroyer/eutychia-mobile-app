import 'dart:convert';

import 'package:Eutychia/models/questionnaires/stroop_test_color.dart';
import 'package:Eutychia/ui/screens/tests/base_questionnaire_widget.dart';
import 'package:Eutychia/ui/screens/tests/display_factory.dart';
import 'package:Eutychia/viewmodels/tests/stroop_test_color_viewmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StroopTestColorWidget extends StatefulWidget {
  final DisplayFactory _displayFactory;
  final StroopTestColorViewModel _stroopTestColorViewModel;

  StroopTestColorWidget(this._displayFactory, this._stroopTestColorViewModel);

  @override
  StroopTestColorWidgetState createState() =>
      StroopTestColorWidgetState(_displayFactory, _stroopTestColorViewModel);
}

class StroopTestColorWidgetState extends BaseQuestionnaireWidget {
  final DisplayFactory _displayFactory;
  final StroopTestColorViewModel _stroopTestColorViewModel;
  StroopTestColorWidgetState(
      this._displayFactory, this._stroopTestColorViewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(appBarTitle)),
        body: FutureBuilder<StroopTestColor>(
            future: parseJson(),
            builder: (context, AsyncSnapshot<StroopTestColor> snapshot) {
              if (snapshot.hasData) {
                WidgetsBinding.instance.addPostFrameCallback(
                    (_) => updateBarTitle(snapshot.data.title));
                return CarouselSlider(
                    items: List.generate(
                        snapshot.data.tasks.length + 2,
                        (index) =>
                            _displayFactory.partOfQuestionnaireToDisplayFactory(
                                index,
                                snapshot.data.tasks,
                                nextQuestionClicked,
                                snapshot.data.description,
                                snapshot.data.finalRemark,
                                snapshot.data.displayAnswers,
                                _stroopTestColorViewModel.answers)),
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

  Future<StroopTestColor> parseJson() async {
    String jsonString = await rootBundle
        .loadString('assets/resources/stroop-test-color-data.json');
    final jsonResponse = jsonDecode(jsonString);
    return StroopTestColor.fromJson(jsonResponse);
  }

  void nextQuestionClicked([Object answer]) {
    _stroopTestColorViewModel.updateAnswers(answer);
    buttonCarouselController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }
}
