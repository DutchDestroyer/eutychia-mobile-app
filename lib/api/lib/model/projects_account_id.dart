//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectsAccountId {
  /// Returns a new [ProjectsAccountId] instance.
  ProjectsAccountId({
    this.projects = const [],
  });

  /// an array with all projects
  List<Project> projects;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectsAccountId &&
     other.projects == projects;

  @override
  int get hashCode =>
    (projects == null ? 0 : projects.hashCode);

  @override
  String toString() => 'ProjectsAccountId[projects=$projects]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (projects != null) {
      json['projects'] = projects;
    }
    return json;
  }

  /// Returns a new [ProjectsAccountId] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static ProjectsAccountId fromJson(Map<String, dynamic> json) => json == null
    ? null
    : ProjectsAccountId(
        projects: Project.listFromJson(json['projects']),
    );

  static List<ProjectsAccountId> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <ProjectsAccountId>[]
      : json.map((v) => ProjectsAccountId.fromJson(v)).toList(growable: true == growable);

  static Map<String, ProjectsAccountId> mapFromJson(Map<String, dynamic> json) {
    final map = <String, ProjectsAccountId>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = ProjectsAccountId.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of ProjectsAccountId-objects as value to a dart map
  static Map<String, List<ProjectsAccountId>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<ProjectsAccountId>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = ProjectsAccountId.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

