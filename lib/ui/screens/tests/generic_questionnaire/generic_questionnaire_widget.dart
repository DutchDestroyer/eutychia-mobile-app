import 'dart:convert';

import 'package:Eutychia/models/questionnaires/generic_questionnaire.dart';
import 'package:Eutychia/ui/screens/tests/display_factory.dart';
import 'package:Eutychia/viewmodels/tests/generic_questionnaire_viewmodel.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '../base_questionnaire_widget.dart';

class GenericQuestionnaireWidget extends StatefulWidget {
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
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
      body: FutureBuilder<GenericQuestionnaire>(
          future: parseJson(),
          builder: (context, AsyncSnapshot<GenericQuestionnaire> snapshot) {
            if (snapshot.hasData) {
              WidgetsBinding.instance.addPostFrameCallback(
                  (_) => updateBarTitle(snapshot.data.title));
              return CarouselSlider(
                  items: List.generate(
                      snapshot.data.questions.length + 2,
                      (index) =>
                          _displayFactory.partOfQuestionnaireToDisplayFactory(
                              index,
                              snapshot.data.questions,
                              nextQuestionClicked,
                              snapshot.data.description,
                              snapshot.data.finalRemark,
                              snapshot.data.displayAnswers,
                              _genericQuestionnaireViewModel.answers)),
                  carouselController: buttonCarouselController,
                  options: CarouselOptions(
                      height: MediaQuery.of(context).size.height,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      autoPlay: false,
                      viewportFraction: 1.0));
            } else {
              return Text('waiting');
            }
          }),
    );
  }

  Future<GenericQuestionnaire> parseJson() async {
    String jsonString =
        await rootBundle.loadString('assets/questionnaires/PHQ-9.json');
    final jsonResponse = jsonDecode(jsonString);
    return GenericQuestionnaire.fromJson(jsonResponse);
  }

  void nextQuestionClicked([Object answer]) {
    _genericQuestionnaireViewModel.updateAnswers(answer);
    buttonCarouselController.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.linear);
  }
}
