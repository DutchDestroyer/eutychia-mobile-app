import 'package:json_annotation/json_annotation.dart';

import 'equestionnaire_type.dart';

part 'questionnaires_list.g.dart';

@JsonSerializable()
class QuestionnairesList {
  final List<QuestionnaireType> questionnaireTitles;

  QuestionnairesList(this.questionnaireTitles);

  factory QuestionnairesList.fromJson(Map<String, dynamic> json) =>
      _$QuestionnairesListFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionnairesListToJson(this);
}
