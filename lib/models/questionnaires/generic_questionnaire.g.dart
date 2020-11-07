// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_questionnaire.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericQuestionnaire _$GenericQuestionnaireFromJson(Map<String, dynamic> json) {
  return GenericQuestionnaire(
    (json['questions'] as List)
        ?.map((e) => e == null
            ? null
            : GenericQuestion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['title'] as String,
    json['description'] as String,
    json['displayAnswers'] as bool,
    json['finalRemark'] as String,
  );
}

Map<String, dynamic> _$GenericQuestionnaireToJson(
        GenericQuestionnaire instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'displayAnswers': instance.displayAnswers,
      'finalRemark': instance.finalRemark,
      'questions': instance.questions?.map((e) => e?.toJson())?.toList(),
    };
