// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stroop_test_direction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StroopTestDirection _$StroopTestDirectionFromJson(Map<String, dynamic> json) {
  return StroopTestDirection(
    (json['tasks'] as List)
        ?.map((e) => e == null
            ? null
            : StroopTestDirectionObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StroopTestDirectionToJson(
        StroopTestDirection instance) =>
    <String, dynamic>{
      'tasks': instance.tasks?.map((e) => e?.toJson())?.toList(),
    };
