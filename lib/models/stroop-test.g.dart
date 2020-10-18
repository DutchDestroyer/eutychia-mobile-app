// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stroop-test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StroopTest _$StroopTestFromJson(Map<String, dynamic> json) {
  return StroopTest(
    (json['colors'] as List)?.map((e) => e as String)?.toList(),
    (json['words'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$StroopTestToJson(StroopTest instance) =>
    <String, dynamic>{
      'colors': instance.colors,
      'words': instance.words,
    };
