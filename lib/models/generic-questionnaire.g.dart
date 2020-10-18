// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic-questionnaire.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericQuestionnaire _$GenericQuestionnaireFromJson(Map<String, dynamic> json) {
  return GenericQuestionnaire(
    json['title'] as String,
    (json['questions'] as List)
        ?.map((e) => e == null
            ? null
            : GenericQuestion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GenericQuestionnaireToJson(
        GenericQuestionnaire instance) =>
    <String, dynamic>{
      'title': instance.title,
      'questions': instance.questions?.map((e) => e?.toJson())?.toList(),
    };
