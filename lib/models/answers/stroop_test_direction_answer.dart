import 'package:Eutychia/models/questionnaires/estroop_direction_type.dart';

class StroopTestDirectionAnswer {
  final StroopDirectionType givenAnswer;
  final StroopDirectionType correctAnswer;
  int time;

  StroopTestDirectionAnswer(this.givenAnswer, this.correctAnswer);
}
