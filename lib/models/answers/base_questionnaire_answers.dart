import 'package:flutter/cupertino.dart';

class BaseQuestionnaireAnswers<T> extends ChangeNotifier {
  List<T> answers = List<T>();

  void add(T answer) {
    answers.add(answer);
    notifyListeners();
  }
}
