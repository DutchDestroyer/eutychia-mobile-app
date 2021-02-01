//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetAccountIdResponse {
  /// Returns a new [GetAccountIdResponse] instance.
  GetAccountIdResponse({
    @required this.ID,
    @required this.name,
    @required this.email,
  });

  /// The id of the account
  String ID;

  /// the name of the account
  String name;

  /// the email address of the account
  String email;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetAccountIdResponse &&
     other.ID == ID &&
     other.name == name &&
     other.email == email;

  @override
  int get hashCode =>
    (ID == null ? 0 : ID.hashCode) +
    (name == null ? 0 : name.hashCode) +
    (email == null ? 0 : email.hashCode);

  @override
  String toString() => 'GetAccountIdResponse[ID=$ID, name=$name, email=$email]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (ID != null) {
      json['ID'] = ID;
    }
    if (name != null) {
      json['Name'] = name;
    }
    if (email != null) {
      json['Email'] = email;
    }
    return json;
  }

  /// Returns a new [GetAccountIdResponse] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static GetAccountIdResponse fromJson(Map<String, dynamic> json) => json == null
    ? null
    : GetAccountIdResponse(
        ID: json['ID'],
        name: json['Name'],
        email: json['Email'],
    );

  static List<GetAccountIdResponse> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <GetAccountIdResponse>[]
      : json.map((v) => GetAccountIdResponse.fromJson(v)).toList(growable: true == growable);

  static Map<String, GetAccountIdResponse> mapFromJson(Map<String, dynamic> json) {
    final map = <String, GetAccountIdResponse>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = GetAccountIdResponse.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of GetAccountIdResponse-objects as value to a dart map
  static Map<String, List<GetAccountIdResponse>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<GetAccountIdResponse>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = GetAccountIdResponse.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

