import 'package:Eutychia/models/questionnaires/stroop_test_direction_object.dart';
import 'package:json_annotation/json_annotation.dart';

import 'base_questionnaire.dart';

part 'stroop_test_direction.g.dart';

@JsonSerializable(explicitToJson: true)
class StroopTestDirection extends BaseQuestionnaire {
  final List<StroopTestDirectionObject> tasks;

  StroopTestDirection(this.tasks, String title, String description,
      bool displayAnswers, String finalRemark)
      : super(title, description, displayAnswers, finalRemark);

  factory StroopTestDirection.fromJson(Map<String, dynamic> json) =>
      _$StroopTestDirectionFromJson(json);

  Map<String, dynamic> toJson() => _$StroopTestDirectionToJson(this);
}
