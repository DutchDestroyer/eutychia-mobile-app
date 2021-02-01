//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GenericTestQuestions {
  /// Returns a new [GenericTestQuestions] instance.
  GenericTestQuestions({
    this.question,
    this.questionType,
    this.answers = const [],
  });

  
  String question;

  
  GenericTestQuestionsQuestionTypeEnum questionType;

  
  List<String> answers;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GenericTestQuestions &&
     other.question == question &&
     other.questionType == questionType &&
     other.answers == answers;

  @override
  int get hashCode =>
    (question == null ? 0 : question.hashCode) +
    (questionType == null ? 0 : questionType.hashCode) +
    (answers == null ? 0 : answers.hashCode);

  @override
  String toString() => 'GenericTestQuestions[question=$question, questionType=$questionType, answers=$answers]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (question != null) {
      json['question'] = question;
    }
    if (questionType != null) {
      json['questionType'] = questionType;
    }
    if (answers != null) {
      json['answers'] = answers;
    }
    return json;
  }

  /// Returns a new [GenericTestQuestions] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static GenericTestQuestions fromJson(Map<String, dynamic> json) => json == null
    ? null
    : GenericTestQuestions(
        question: json['question'],
        questionType: GenericTestQuestionsQuestionTypeEnum.fromJson(json['questionType']),
        answers: json['answers'] == null
          ? null
          : (json['answers'] as List).cast<String>(),
    );

  static List<GenericTestQuestions> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <GenericTestQuestions>[]
      : json.map((v) => GenericTestQuestions.fromJson(v)).toList(growable: true == growable);

  static Map<String, GenericTestQuestions> mapFromJson(Map<String, dynamic> json) {
    final map = <String, GenericTestQuestions>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = GenericTestQuestions.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of GenericTestQuestions-objects as value to a dart map
  static Map<String, List<GenericTestQuestions>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<GenericTestQuestions>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = GenericTestQuestions.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}


class GenericTestQuestionsQuestionTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const GenericTestQuestionsQuestionTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  bool operator ==(Object other) => identical(this, other) ||
      other is GenericTestQuestionsQuestionTypeEnum && other.value == value ||
      other is String && other == value;

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() => value;

  String toJson() => value;

  static const openquestion_ = GenericTestQuestionsQuestionTypeEnum._('openQuestion');
  static const multiplechoice_ = GenericTestQuestionsQuestionTypeEnum._('multipleChoice');
  static const slider_ = GenericTestQuestionsQuestionTypeEnum._('slider');

  /// List of all possible values in this [enum][GenericTestQuestionsQuestionTypeEnum].
  static const values = <GenericTestQuestionsQuestionTypeEnum>[
    openquestion_,
    multiplechoice_,
    slider_,
  ];

  static GenericTestQuestionsQuestionTypeEnum fromJson(dynamic value) =>
    GenericTestQuestionsQuestionTypeEnumTypeTransformer().decode(value);

  static List<GenericTestQuestionsQuestionTypeEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <GenericTestQuestionsQuestionTypeEnum>[]
      : json
          .map((value) => GenericTestQuestionsQuestionTypeEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [GenericTestQuestionsQuestionTypeEnum] to String,
/// and [decode] dynamic data back to [GenericTestQuestionsQuestionTypeEnum].
class GenericTestQuestionsQuestionTypeEnumTypeTransformer {
  const GenericTestQuestionsQuestionTypeEnumTypeTransformer._();

  factory GenericTestQuestionsQuestionTypeEnumTypeTransformer() => _instance ??= GenericTestQuestionsQuestionTypeEnumTypeTransformer._();

  String encode(GenericTestQuestionsQuestionTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a GenericTestQuestionsQuestionTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GenericTestQuestionsQuestionTypeEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case 'openQuestion': return GenericTestQuestionsQuestionTypeEnum.openquestion_;
      case 'multipleChoice': return GenericTestQuestionsQuestionTypeEnum.multiplechoice_;
      case 'slider': return GenericTestQuestionsQuestionTypeEnum.slider_;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [GenericTestQuestionsQuestionTypeEnumTypeTransformer] instance.
  static GenericTestQuestionsQuestionTypeEnumTypeTransformer _instance;
}

