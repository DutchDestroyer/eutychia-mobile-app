// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questionnaires-list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionnairesList _$QuestionnairesListFromJson(Map<String, dynamic> json) {
  return QuestionnairesList(
    (json['questionnaireTitles'] as List)
        ?.map((e) => _$enumDecodeNullable(_$QuestionnaireTypeEnumMap, e))
        ?.toList(),
  );
}

Map<String, dynamic> _$QuestionnairesListToJson(QuestionnairesList instance) =>
    <String, dynamic>{
      'questionnaireTitles': instance.questionnaireTitles
          ?.map((e) => _$QuestionnaireTypeEnumMap[e])
          ?.toList(),
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
