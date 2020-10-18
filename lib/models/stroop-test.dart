import 'package:json_annotation/json_annotation.dart';

part 'stroop-test.g.dart';

@JsonSerializable()
class StroopTest {
  final List<String> colors;
  final List<String> words;

  StroopTest(this.colors, this.words);

  factory StroopTest.fromJson(Map<String, dynamic> json) =>
      _$StroopTestFromJson(json);

  Map<String, dynamic> toJson() => _$StroopTestToJson(this);
}
