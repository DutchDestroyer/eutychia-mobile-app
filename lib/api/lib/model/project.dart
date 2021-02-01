//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Project {
  /// Returns a new [Project] instance.
  Project({
    this.projectID,
    this.projectName,
  });

  /// the id of a project
  String projectID;

  /// the name of a project
  String projectName;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Project &&
     other.projectID == projectID &&
     other.projectName == projectName;

  @override
  int get hashCode =>
    (projectID == null ? 0 : projectID.hashCode) +
    (projectName == null ? 0 : projectName.hashCode);

  @override
  String toString() => 'Project[projectID=$projectID, projectName=$projectName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (projectID != null) {
      json['projectID'] = projectID;
    }
    if (projectName != null) {
      json['projectName'] = projectName;
    }
    return json;
  }

  /// Returns a new [Project] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static Project fromJson(Map<String, dynamic> json) => json == null
    ? null
    : Project(
        projectID: json['projectID'],
        projectName: json['projectName'],
    );

  static List<Project> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <Project>[]
      : json.map((v) => Project.fromJson(v)).toList(growable: true == growable);

  static Map<String, Project> mapFromJson(Map<String, dynamic> json) {
    final map = <String, Project>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = Project.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of Project-objects as value to a dart map
  static Map<String, List<Project>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<Project>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = Project.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

