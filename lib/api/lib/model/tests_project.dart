//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TestsProject {
  /// Returns a new [TestsProject] instance.
  TestsProject({
    this.testsToPerform = const [],
  });

  /// array of tests
  List<Test> testsToPerform;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TestsProject &&
     other.testsToPerform == testsToPerform;

  @override
  int get hashCode =>
    (testsToPerform == null ? 0 : testsToPerform.hashCode);

  @override
  String toString() => 'TestsProject[testsToPerform=$testsToPerform]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (testsToPerform != null) {
      json['testsToPerform'] = testsToPerform;
    }
    return json;
  }

  /// Returns a new [TestsProject] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static TestsProject fromJson(Map<String, dynamic> json) => json == null
    ? null
    : TestsProject(
        testsToPerform: Test.listFromJson(json['testsToPerform']),
    );

  static List<TestsProject> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <TestsProject>[]
      : json.map((v) => TestsProject.fromJson(v)).toList(growable: true == growable);

  static Map<String, TestsProject> mapFromJson(Map<String, dynamic> json) {
    final map = <String, TestsProject>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = TestsProject.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of TestsProject-objects as value to a dart map
  static Map<String, List<TestsProject>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<TestsProject>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = TestsProject.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

