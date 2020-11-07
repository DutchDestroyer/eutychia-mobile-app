import 'package:Eutychia/models/stroop_test_color_task.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stroop_test_color.g.dart';

@JsonSerializable(explicitToJson: true)
class StroopTestColor {
  final List<StroopTestColorTask> tasks;

  StroopTestColor(this.tasks);

  factory StroopTestColor.fromJson(Map<String, dynamic> json) =>
      _$StroopTestColorFromJson(json);

  Map<String, dynamic> toJson() => _$StroopTestColorToJson(this);
}
