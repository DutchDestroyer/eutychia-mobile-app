// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stroop_test_color_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StroopTestColorTask _$StroopTestColorTaskFromJson(Map<String, dynamic> json) {
  return StroopTestColorTask(
    (json['objects'] as List)
        ?.map((e) => e == null
            ? null
            : StroopTestColorObject.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    _$enumDecodeNullable(_$StroopColorTypeEnumMap, json['colorOfWord']),
  );
}

Map<String, dynamic> _$StroopTestColorTaskToJson(
        StroopTestColorTask instance) =>
    <String, dynamic>{
      'objects': instance.objects?.map((e) => e?.toJson())?.toList(),
      'colorOfWord': _$StroopColorTypeEnumMap[instance.colorOfWord],
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

const _$StroopColorTypeEnumMap = {
  StroopColorType.Red: 'Red',
  StroopColorType.Blue: 'Blue',
  StroopColorType.Green: 'Green',
  StroopColorType.Purple: 'Purple',
  StroopColorType.Orange: 'Orange',
};
