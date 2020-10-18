import 'package:json_annotation/json_annotation.dart';

import 'equestionnaire-type.dart';

part 'questionnaires-list.g.dart';

@JsonSerializable()
class QuestionnairesList {
  final List<QuestionnaireType> questionnaireTitles;

  QuestionnairesList(this.questionnaireTitles);

  factory QuestionnairesList.fromJson(Map<String, dynamic> json) =>
      _$QuestionnairesListFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionnairesListToJson(this);
}
