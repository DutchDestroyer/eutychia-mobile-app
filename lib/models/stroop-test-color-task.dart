import 'package:Eutychia/models/estroop-color-type.dart';
import 'package:Eutychia/models/stroop-test-color-object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stroop-test-color-task.g.dart';

@JsonSerializable(explicitToJson: true)
class StroopTestColorTask {
  final List<StroopTestColorObject> objects;
  final StroopColorType colorOfWord;

  StroopTestColorTask(this.objects, this.colorOfWord);

  factory StroopTestColorTask.fromJson(Map<String, dynamic> json) =>
      _$StroopTestColorTaskFromJson(json);

  Map<String, dynamic> toJson() => _$StroopTestColorTaskToJson(this);
}
