//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JWTAccountDetails {
  /// Returns a new [JWTAccountDetails] instance.
  JWTAccountDetails({
    @required this.JWT,
  });

  /// The jwt token with all information.
  String JWT;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JWTAccountDetails &&
     other.JWT == JWT;

  @override
  int get hashCode =>
    (JWT == null ? 0 : JWT.hashCode);

  @override
  String toString() => 'JWTAccountDetails[JWT=$JWT]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (JWT != null) {
      json['JWT'] = JWT;
    }
    return json;
  }

  /// Returns a new [JWTAccountDetails] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static JWTAccountDetails fromJson(Map<String, dynamic> json) => json == null
    ? null
    : JWTAccountDetails(
        JWT: json['JWT'],
    );

  static List<JWTAccountDetails> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <JWTAccountDetails>[]
      : json.map((v) => JWTAccountDetails.fromJson(v)).toList(growable: true == growable);

  static Map<String, JWTAccountDetails> mapFromJson(Map<String, dynamic> json) {
    final map = <String, JWTAccountDetails>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = JWTAccountDetails.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of JWTAccountDetails-objects as value to a dart map
  static Map<String, List<JWTAccountDetails>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<JWTAccountDetails>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = JWTAccountDetails.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

