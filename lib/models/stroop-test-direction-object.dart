import 'package:Eutychia/models/estroop-direction-type.dart';

import 'package:json_annotation/json_annotation.dart';

part 'stroop-test-direction-object.g.dart';

@JsonSerializable()
class StroopTestDirectionObject {
  final StroopDirectionType direction;
  final StroopDirectionType text;

  StroopTestDirectionObject(this.direction, this.text);

  factory StroopTestDirectionObject.fromJson(Map<String, dynamic> json) =>
      _$StroopTestDirectionObjectFromJson(json);

  Map<String, dynamic> toJson() => _$StroopTestDirectionObjectToJson(this);
}
