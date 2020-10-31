import 'package:Eutychia/models/stroop-test-direction-object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stroop-test-direction.g.dart';

@JsonSerializable(explicitToJson: true)
class StroopTestDirection {
  final List<StroopTestDirectionObject> tasks;

  StroopTestDirection(this.tasks);

  factory StroopTestDirection.fromJson(Map<String, dynamic> json) =>
      _$StroopTestDirectionFromJson(json);

  Map<String, dynamic> toJson() => _$StroopTestDirectionToJson(this);
}
