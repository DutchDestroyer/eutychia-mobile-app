//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GenericTestAnswers {
  /// Returns a new [GenericTestAnswers] instance.
  GenericTestAnswers({
    this.accountID,
    this.answers = const [],
  });

  /// the id of the account that performed this test
  String accountID;

  /// the array of answers for this questionnaire
  List<AnswerToQuestion> answers;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GenericTestAnswers &&
     other.accountID == accountID &&
     other.answers == answers;

  @override
  int get hashCode =>
    (accountID == null ? 0 : accountID.hashCode) +
    (answers == null ? 0 : answers.hashCode);

  @override
  String toString() => 'GenericTestAnswers[accountID=$accountID, answers=$answers]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (accountID != null) {
      json['accountID'] = accountID;
    }
    if (answers != null) {
      json['answers'] = answers;
    }
    return json;
  }

  /// Returns a new [GenericTestAnswers] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static GenericTestAnswers fromJson(Map<String, dynamic> json) => json == null
    ? null
    : GenericTestAnswers(
        accountID: json['accountID'],
        answers: AnswerToQuestion.listFromJson(json['answers']),
    );

  static List<GenericTestAnswers> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <GenericTestAnswers>[]
      : json.map((v) => GenericTestAnswers.fromJson(v)).toList(growable: true == growable);

  static Map<String, GenericTestAnswers> mapFromJson(Map<String, dynamic> json) {
    final map = <String, GenericTestAnswers>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = GenericTestAnswers.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of GenericTestAnswers-objects as value to a dart map
  static Map<String, List<GenericTestAnswers>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<GenericTestAnswers>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = GenericTestAnswers.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

