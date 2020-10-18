// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Questionnaire.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Questionnaire _$QuestionnaireFromJson(Map<String, dynamic> json) {
  return Questionnaire(
    json['title'] as String,
    (json['questions'] as List)
        ?.map((e) =>
            e == null ? null : Question.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$QuestionnaireToJson(Questionnaire instance) =>
    <String, dynamic>{
      'title': instance.title,
      'questions': instance.questions?.map((e) => e?.toJson())?.toList(),
    };
