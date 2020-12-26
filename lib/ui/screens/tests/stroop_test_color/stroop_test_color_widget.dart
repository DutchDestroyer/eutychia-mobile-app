import 'dart:convert';

import 'package:Eutychia/models/new/test_project_ID.dart';
import 'package:Eutychia/models/questionnaires/stroop_test_color.dart';
import 'package:Eutychia/ui/screens/tests/base_questionnaire_widget.dart';
import 'package:Eutychia/ui/screens/tests/display_factory.dart';
import 'package:Eutychia/viewmodels/tests/stroop_test_color_viewmodel.dart';
import 'package:Eutychia/viewmodels/end_of_questionnaire_viewmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StroopTestColorWidget extends StatefulWidget {
  static const routename = '/strooptestcolor';
  final DisplayFactory _displayFactory;
  final StroopTestColorViewModel _stroopTestColorViewModel;
  final EndOfQuestionnaireViewModel _endOfQuestionnaireViewModel;

  StroopTestColorWidget(this._displayFactory, this._stroopTestColorViewModel,
      this._endOfQuestionnaireViewModel);

  @override
  _StroopTestColorWidgetState createState() => _StroopTestColorWidgetState(
      _displayFactory, _stroopTestColorViewModel, _endOfQuestionnaireViewModel);
}

class _StroopTestColorWidgetState extends BaseQuestionnaireWidget {
  final DisplayFactory _displayFactory;
  final StroopTestColorViewModel _stroopTestColorViewModel;
  final EndOfQuestionnaireViewModel _endOfQuestionnaireViewModel;

  _StroopTestColorWidgetState(this._displayFactory,
      this._stroopTestColorViewModel, this._endOfQuestionnaireViewModel);

  @override
  Widget build(BuildContext context) {
    final TestProjectID testProjectID =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(title: Text(appBarTitle)),
        body: FutureBuilder<StroopTestColor>(
            future: _parseJson(),
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
                                _nextQuestionClicked,
                                snapshot.data.description,
                                snapshot.data.finalRemark,
                                snapshot.data.displayAnswers,
                                _stroopTestColorViewModel.answers,
                                _endOfQuestionnaireViewModel,
                                testProjectID.projectID,
                                testProjectID.testID)),
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

  Future<StroopTestColor> _parseJson() async {
    String jsonString = await rootBundle
        .loadString('assets/resources/stroop-test-color-data.json');
    final jsonResponse = jsonDecode(jsonString);
    return StroopTestColor.fromJson(jsonResponse);
  }

  void _nextQuestionClicked([Object answer]) {
    _stroopTestColorViewModel.updateAnswers(answer);
    buttonCarouselController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }
}
