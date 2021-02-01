//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class LogoutAccount {
  /// Returns a new [LogoutAccount] instance.
  LogoutAccount({
    @required this.accessToken,
  });

  /// access token that needs to be revoked to log out
  String accessToken;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LogoutAccount &&
     other.accessToken == accessToken;

  @override
  int get hashCode =>
    (accessToken == null ? 0 : accessToken.hashCode);

  @override
  String toString() => 'LogoutAccount[accessToken=$accessToken]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (accessToken != null) {
      json['accessToken'] = accessToken;
    }
    return json;
  }

  /// Returns a new [LogoutAccount] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static LogoutAccount fromJson(Map<String, dynamic> json) => json == null
    ? null
    : LogoutAccount(
        accessToken: json['accessToken'],
    );

  static List<LogoutAccount> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <LogoutAccount>[]
      : json.map((v) => LogoutAccount.fromJson(v)).toList(growable: true == growable);

  static Map<String, LogoutAccount> mapFromJson(Map<String, dynamic> json) {
    final map = <String, LogoutAccount>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = LogoutAccount.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of LogoutAccount-objects as value to a dart map
  static Map<String, List<LogoutAccount>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<LogoutAccount>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = LogoutAccount.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

