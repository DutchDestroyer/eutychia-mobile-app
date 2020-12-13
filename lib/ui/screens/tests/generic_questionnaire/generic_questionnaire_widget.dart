import 'package:Eutychia/models/new/test_project_ID.dart';
import 'package:Eutychia/models/questionnaires/generic_questionnaire.dart';
import 'package:Eutychia/ui/screens/progress_bar_indicator.dart';
import 'package:Eutychia/ui/screens/tests/display_factory.dart';
import 'package:Eutychia/viewmodels/tests/generic_questionnaire_viewmodel.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../base_questionnaire_widget.dart';

class GenericQuestionnaireWidget extends StatefulWidget {
  static const routeName = '/genericquestionnaire';

  final DisplayFactory _displayFactory;
  final GenericQuestionnaireViewModel _genericQuestionnaireViewModel;
  GenericQuestionnaireWidget(
      this._displayFactory, this._genericQuestionnaireViewModel);

  @override
  GenericQuestionnaireWidgetState createState() =>
      GenericQuestionnaireWidgetState(
          _displayFactory, _genericQuestionnaireViewModel);
}

class GenericQuestionnaireWidgetState extends BaseQuestionnaireWidget {
  final DisplayFactory _displayFactory;
  final GenericQuestionnaireViewModel _genericQuestionnaireViewModel;
  GenericQuestionnaireWidgetState(
      this._displayFactory, this._genericQuestionnaireViewModel);

  @override
  Widget build(BuildContext context) {
    final TestProjectID testProjectID =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
      body: FutureBuilder<Either<dynamic, GenericQuestionnaire>>(
          future: _genericQuestionnaireViewModel.getGenericTestData(
              testProjectID.testID, testProjectID.projectID),
          builder: (context,
              AsyncSnapshot<Either<dynamic, GenericQuestionnaire>> snapshot) {
            if (snapshot.hasData) {
              return snapshot.data.fold(
                  (l) => Text("Couldn't collect the data"),
                  (genericQuestionnaire) =>
                      _createTestView(genericQuestionnaire));
            } else {
              return progressBarIndicator();
            }
          }),
    );
  }

  Widget _createTestView(GenericQuestionnaire genericQuestionnaire) {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => updateBarTitle(genericQuestionnaire.title));
    return CarouselSlider(
        items: List.generate(
            genericQuestionnaire.questions.length + 2,
            (index) => _displayFactory.partOfQuestionnaireToDisplayFactory(
                index,
                genericQuestionnaire.questions,
                _nextQuestionClicked,
                genericQuestionnaire.description,
                genericQuestionnaire.finalRemark,
                genericQuestionnaire.displayAnswers,
                _genericQuestionnaireViewModel.answers)),
        carouselController: buttonCarouselController,
        options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            initialPage: 0,
            enableInfiniteScroll: false,
            autoPlay: false,
            viewportFraction: 1.0));
  }

  void _nextQuestionClicked([Object answer]) {
    _genericQuestionnaireViewModel.updateAnswers(answer);
    buttonCarouselController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }
}
