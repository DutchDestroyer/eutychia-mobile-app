import 'package:Eutychia/models/estroop_color_type.dart';
import 'package:Eutychia/models/stroop_test_color_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stroop_test_color_task.g.dart';

@JsonSerializable(explicitToJson: true)
class StroopTestColorTask {
  final List<StroopTestColorObject> objects;
  final StroopColorType colorOfWord;

  StroopTestColorTask(this.objects, this.colorOfWord);

  factory StroopTestColorTask.fromJson(Map<String, dynamic> json) =>
      _$StroopTestColorTaskFromJson(json);

  Map<String, dynamic> toJson() => _$StroopTestColorTaskToJson(this);
}
