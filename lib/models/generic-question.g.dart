// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic-question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericQuestion _$GenericQuestionFromJson(Map<String, dynamic> json) {
  return GenericQuestion(
    json['question'] as String,
    _$enumDecodeNullable(_$QuestionTypeEnumMap, json['questionType']),
    (json['answers'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$GenericQuestionToJson(GenericQuestion instance) =>
    <String, dynamic>{
      'question': instance.question,
      'questionType': _$QuestionTypeEnumMap[instance.questionType],
      'answers': instance.answers,
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

const _$QuestionTypeEnumMap = {
  QuestionType.openQuestion: 'openQuestion',
  QuestionType.multipleChoice: 'multipleChoice',
  QuestionType.slider: 'slider',
};
