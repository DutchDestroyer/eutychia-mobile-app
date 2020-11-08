import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseQuestionnaireWidget extends State<StatefulWidget> {
  CarouselController buttonCarouselController = CarouselController();

  String appBarTitle = 'Waiting';

  void updateBarTitle(String title) {
    setState(() {
      appBarTitle = title;
    });
  }
}
