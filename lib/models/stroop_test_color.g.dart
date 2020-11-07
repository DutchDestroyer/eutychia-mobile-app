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
    json['title'] as String,
    json['description'] as String,
    json['displayAnswers'] as bool,
    json['finalRemark'] as String,
  );
}

Map<String, dynamic> _$StroopTestColorToJson(StroopTestColor instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'displayAnswers': instance.displayAnswers,
      'finalRemark': instance.finalRemark,
      'tasks': instance.tasks?.map((e) => e?.toJson())?.toList(),
    };
