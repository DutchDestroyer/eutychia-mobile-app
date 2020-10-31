// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stroop-test-direction-object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StroopTestDirectionObject _$StroopTestDirectionObjectFromJson(
    Map<String, dynamic> json) {
  return StroopTestDirectionObject(
    _$enumDecodeNullable(_$StroopDirectionTypeEnumMap, json['direction']),
    _$enumDecodeNullable(_$StroopDirectionTypeEnumMap, json['text']),
  );
}

Map<String, dynamic> _$StroopTestDirectionObjectToJson(
        StroopTestDirectionObject instance) =>
    <String, dynamic>{
      'direction': _$StroopDirectionTypeEnumMap[instance.direction],
      'text': _$StroopDirectionTypeEnumMap[instance.text],
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

const _$StroopDirectionTypeEnumMap = {
  StroopDirectionType.left: 'left',
  StroopDirectionType.right: 'right',
  StroopDirectionType.top: 'top',
  StroopDirectionType.bottom: 'bottom',
};
