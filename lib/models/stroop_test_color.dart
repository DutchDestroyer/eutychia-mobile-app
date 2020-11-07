import 'package:Eutychia/models/base_questionnaire.dart';
import 'package:Eutychia/models/stroop_test_color_task.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stroop_test_color.g.dart';

@JsonSerializable(explicitToJson: true)
class StroopTestColor extends BaseQuestionnaire {
  final List<StroopTestColorTask> tasks;

  StroopTestColor(
      this.tasks, String title, String description, bool displayAnswers, String finalRemark)
      : super(title, description, displayAnswers, finalRemark);

  factory StroopTestColor.fromJson(Map<String, dynamic> json) =>
      _$StroopTestColorFromJson(json);

  Map<String, dynamic> toJson() => _$StroopTestColorToJson(this);
}
