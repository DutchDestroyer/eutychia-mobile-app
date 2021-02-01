//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AnswerToQuestion {
  /// Returns a new [AnswerToQuestion] instance.
  AnswerToQuestion({
    this.question,
    this.answer,
    this.timeToAnswer,
  });

  /// the question number
  int question;

  /// an answer to a question
  String answer;

  /// the time in milliseconds to answer the question
  num timeToAnswer;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AnswerToQuestion &&
     other.question == question &&
     other.answer == answer &&
     other.timeToAnswer == timeToAnswer;

  @override
  int get hashCode =>
    (question == null ? 0 : question.hashCode) +
    (answer == null ? 0 : answer.hashCode) +
    (timeToAnswer == null ? 0 : timeToAnswer.hashCode);

  @override
  String toString() => 'AnswerToQuestion[question=$question, answer=$answer, timeToAnswer=$timeToAnswer]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (question != null) {
      json['question'] = question;
    }
    if (answer != null) {
      json['answer'] = answer;
    }
    if (timeToAnswer != null) {
      json['timeToAnswer'] = timeToAnswer;
    }
    return json;
  }

  /// Returns a new [AnswerToQuestion] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static AnswerToQuestion fromJson(Map<String, dynamic> json) => json == null
    ? null
    : AnswerToQuestion(
        question: json['question'],
        answer: json['answer'],
        timeToAnswer: json['timeToAnswer'] == null ?
          null :
          json['timeToAnswer'].toDouble(),
    );

  static List<AnswerToQuestion> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <AnswerToQuestion>[]
      : json.map((v) => AnswerToQuestion.fromJson(v)).toList(growable: true == growable);

  static Map<String, AnswerToQuestion> mapFromJson(Map<String, dynamic> json) {
    final map = <String, AnswerToQuestion>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = AnswerToQuestion.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of AnswerToQuestion-objects as value to a dart map
  static Map<String, List<AnswerToQuestion>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<AnswerToQuestion>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = AnswerToQuestion.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

