
import 'package:json_annotation/json_annotation.dart';

import 'estroop_direction_type.dart';

part 'stroop_test_direction_object.g.dart';

@JsonSerializable()
class StroopTestDirectionObject {
  final StroopDirectionType direction;
  final StroopDirectionType text;

  StroopTestDirectionObject(this.direction, this.text);

  factory StroopTestDirectionObject.fromJson(Map<String, dynamic> json) =>
      _$StroopTestDirectionObjectFromJson(json);

  Map<String, dynamic> toJson() => _$StroopTestDirectionObjectToJson(this);
}
