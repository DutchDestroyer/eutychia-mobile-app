//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Test {
  /// Returns a new [Test] instance.
  Test({
    this.testID,
    this.testName,
    this.testType,
  });

  /// id of the test
  String testID;

  /// name of the test
  String testName;

  /// type of the test
  TestTestTypeEnum testType;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Test &&
     other.testID == testID &&
     other.testName == testName &&
     other.testType == testType;

  @override
  int get hashCode =>
    (testID == null ? 0 : testID.hashCode) +
    (testName == null ? 0 : testName.hashCode) +
    (testType == null ? 0 : testType.hashCode);

  @override
  String toString() => 'Test[testID=$testID, testName=$testName, testType=$testType]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (testID != null) {
      json['testID'] = testID;
    }
    if (testName != null) {
      json['testName'] = testName;
    }
    if (testType != null) {
      json['testType'] = testType;
    }
    return json;
  }

  /// Returns a new [Test] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static Test fromJson(Map<String, dynamic> json) => json == null
    ? null
    : Test(
        testID: json['testID'],
        testName: json['testName'],
        testType: TestTestTypeEnum.fromJson(json['testType']),
    );

  static List<Test> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <Test>[]
      : json.map((v) => Test.fromJson(v)).toList(growable: true == growable);

  static Map<String, Test> mapFromJson(Map<String, dynamic> json) {
    final map = <String, Test>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = Test.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of Test-objects as value to a dart map
  static Map<String, List<Test>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<Test>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = Test.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

/// type of the test
class TestTestTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const TestTestTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  bool operator ==(Object other) => identical(this, other) ||
      other is TestTestTypeEnum && other.value == value ||
      other is String && other == value;

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() => value;

  String toJson() => value;

  static const generic_ = TestTestTypeEnum._('generic');
  static const stroopdirection_ = TestTestTypeEnum._('stroopDirection');
  static const stroopcolor_ = TestTestTypeEnum._('stroopColor');

  /// List of all possible values in this [enum][TestTestTypeEnum].
  static const values = <TestTestTypeEnum>[
    generic_,
    stroopdirection_,
    stroopcolor_,
  ];

  static TestTestTypeEnum fromJson(dynamic value) =>
    TestTestTypeEnumTypeTransformer().decode(value);

  static List<TestTestTypeEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <TestTestTypeEnum>[]
      : json
          .map((value) => TestTestTypeEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [TestTestTypeEnum] to String,
/// and [decode] dynamic data back to [TestTestTypeEnum].
class TestTestTypeEnumTypeTransformer {
  const TestTestTypeEnumTypeTransformer._();

  factory TestTestTypeEnumTypeTransformer() => _instance ??= TestTestTypeEnumTypeTransformer._();

  String encode(TestTestTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a TestTestTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  TestTestTypeEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case 'generic': return TestTestTypeEnum.generic_;
      case 'stroopDirection': return TestTestTypeEnum.stroopdirection_;
      case 'stroopColor': return TestTestTypeEnum.stroopcolor_;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [TestTestTypeEnumTypeTransformer] instance.
  static TestTestTypeEnumTypeTransformer _instance;
}

