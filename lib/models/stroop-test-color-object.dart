import 'package:Eutychia/models/estroop-color-type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stroop-test-color-object.g.dart';

@JsonSerializable()
class StroopTestColorObject {
  final StroopColorType color;
  final StroopColorType text;

  StroopTestColorObject(this.color, this.text);

  factory StroopTestColorObject.fromJson(Map<String, dynamic> json) =>
      _$StroopTestColorObjectFromJson(json);

  Map<String, dynamic> toJson() => _$StroopTestColorObjectToJson(this);
}