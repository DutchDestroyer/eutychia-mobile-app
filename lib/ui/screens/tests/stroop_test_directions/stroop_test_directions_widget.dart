import 'dart:convert';

import 'package:Eutychia/models/new/test_project_ID.dart';
import 'package:Eutychia/models/questionnaires/stroop_test_direction.dart';
import 'package:Eutychia/ui/screens/tests/display_factory.dart';
import 'package:Eutychia/viewmodels/tests/stroop_test_direction_viewmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import '../base_questionnaire_widget.dart';

class StroopTestDirectionWidget extends StatefulWidget {
  static const routename = '/strooptestdirections';
  final DisplayFactory _displayFactory;
  final StroopTestDirectionViewModel _stroopTestDirectionViewModel;

  StroopTestDirectionWidget(
      this._displayFactory, this._stroopTestDirectionViewModel);

  @override
  StroopTestDirectionWidgetState createState() =>
      StroopTestDirectionWidgetState(
          _displayFactory, _stroopTestDirectionViewModel);
}

class StroopTestDirectionWidgetState extends BaseQuestionnaireWidget {
  final DisplayFactory _displayFactory;
  final StroopTestDirectionViewModel _stroopTestDirectionViewModel;

  StroopTestDirectionWidgetState(
      this._displayFactory, this._stroopTestDirectionViewModel);

  @override
  Widget build(BuildContext context) {
    final TestProjectID testProjectID =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(title: Text(appBarTitle)),
        body: FutureBuilder<StroopTestDirection>(
            future: parseJson(),
            builder: (context, AsyncSnapshot<StroopTestDirection> snapshot) {
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
                                _stroopTestDirectionViewModel.answers)),
                    carouselController: buttonCarouselController,
                    options: CarouselOptions(
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        autoPlay: false,
                        viewportFraction: 1.0,
                        height: MediaQuery.of(context).size.height));
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

  void nextQuestionClicked([Object answer]) {
    _stroopTestDirectionViewModel.updateAnswers(answer);
    buttonCarouselController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }
}
