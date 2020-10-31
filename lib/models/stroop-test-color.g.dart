// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stroop-test-color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StroopTestColor _$StroopTestColorFromJson(Map<String, dynamic> json) {
  return StroopTestColor(
    (json['tasks'] as List)
        ?.map((e) => e == null
            ? null
            : StroopTestColorObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StroopTestColorToJson(StroopTestColor instance) =>
    <String, dynamic>{
      'tasks': instance.tasks?.map((e) => e?.toJson())?.toList(),
    };
