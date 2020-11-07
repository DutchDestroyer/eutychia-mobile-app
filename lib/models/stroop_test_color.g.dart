// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stroop_test_color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StroopTestColor _$StroopTestColorFromJson(Map<String, dynamic> json) {
  return StroopTestColor(
    (json['tasks'] as List)
        ?.map((e) => e == null
            ? null
            : StroopTestColorTask.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StroopTestColorToJson(StroopTestColor instance) =>
    <String, dynamic>{
      'tasks': instance.tasks?.map((e) => e?.toJson())?.toList(),
    };
