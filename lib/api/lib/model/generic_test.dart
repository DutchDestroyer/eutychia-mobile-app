//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GenericTest {
  /// Returns a new [GenericTest] instance.
  GenericTest({
    @required this.title,
    @required this.description,
    @required this.displayAnswers,
    @required this.finalRemark,
    this.questions = const [],
  });

  /// Title of questionnaire
  String title;

  /// Description of questionnaire
  String description;

  /// To determine whether the answers should be displayed at the end of the questionnaire
  bool displayAnswers;

  /// Final remakrs at the end of the questionnaire
  String finalRemark;

  
  List<GenericTestQuestions> questions;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GenericTest &&
     other.title == title &&
     other.description == description &&
     other.displayAnswers == displayAnswers &&
     other.finalRemark == finalRemark &&
     other.questions == questions;

  @override
  int get hashCode =>
    (title == null ? 0 : title.hashCode) +
    (description == null ? 0 : description.hashCode) +
    (displayAnswers == null ? 0 : displayAnswers.hashCode) +
    (finalRemark == null ? 0 : finalRemark.hashCode) +
    (questions == null ? 0 : questions.hashCode);

  @override
  String toString() => 'GenericTest[title=$title, description=$description, displayAnswers=$displayAnswers, finalRemark=$finalRemark, questions=$questions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (title != null) {
      json['title'] = title;
    }
    if (description != null) {
      json['description'] = description;
    }
    if (displayAnswers != null) {
      json['displayAnswers'] = displayAnswers;
    }
    if (finalRemark != null) {
      json['finalRemark'] = finalRemark;
    }
    if (questions != null) {
      json['questions'] = questions;
    }
    return json;
  }

  /// Returns a new [GenericTest] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static GenericTest fromJson(Map<String, dynamic> json) => json == null
    ? null
    : GenericTest(
        title: json['title'],
        description: json['description'],
        displayAnswers: json['displayAnswers'],
        finalRemark: json['finalRemark'],
        questions: GenericTestQuestions.listFromJson(json['questions']),
    );

  static List<GenericTest> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <GenericTest>[]
      : json.map((v) => GenericTest.fromJson(v)).toList(growable: true == growable);

  static Map<String, GenericTest> mapFromJson(Map<String, dynamic> json) {
    final map = <String, GenericTest>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = GenericTest.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of GenericTest-objects as value to a dart map
  static Map<String, List<GenericTest>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<GenericTest>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = GenericTest.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

