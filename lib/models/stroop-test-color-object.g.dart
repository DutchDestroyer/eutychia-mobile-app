// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stroop-test-color-object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StroopTestColorObject _$StroopTestColorObjectFromJson(
    Map<String, dynamic> json) {
  return StroopTestColorObject(
    _$enumDecodeNullable(_$StroopColorTypeEnumMap, json['color']),
    _$enumDecodeNullable(_$StroopColorTypeEnumMap, json['text']),
  );
}

Map<String, dynamic> _$StroopTestColorObjectToJson(
        StroopTestColorObject instance) =>
    <String, dynamic>{
      'color': _$StroopColorTypeEnumMap[instance.color],
      'text': _$StroopColorTypeEnumMap[instance.text],
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
