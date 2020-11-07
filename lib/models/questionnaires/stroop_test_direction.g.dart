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
    json['title'] as String,
    json['description'] as String,
    json['displayAnswers'] as bool,
    json['finalRemark'] as String,
    _$enumDecodeNullable(_$QuestionnaireTypeEnumMap, json['questionnaireType']),
  );
}

Map<String, dynamic> _$StroopTestDirectionToJson(
        StroopTestDirection instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'displayAnswers': instance.displayAnswers,
      'finalRemark': instance.finalRemark,
      'questionnaireType':
          _$QuestionnaireTypeEnumMap[instance.questionnaireType],
      'tasks': instance.tasks?.map((e) => e?.toJson())?.toList(),
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$QuestionnaireTypeEnumMap = {
  QuestionnaireType.phq9: 'phq9',
  QuestionnaireType.stroopTestColor: 'stroopTestColor',
  QuestionnaireType.stroopTestDirection: 'stroopTestDirection',
};
