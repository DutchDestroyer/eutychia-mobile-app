//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RefreshDetails {
  /// Returns a new [RefreshDetails] instance.
  RefreshDetails({
    @required this.accountID,
    @required this.refreshToken,
  });

  /// The account ID.
  String accountID;

  /// the refreshToken used to update the acces token
  String refreshToken;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RefreshDetails &&
     other.accountID == accountID &&
     other.refreshToken == refreshToken;

  @override
  int get hashCode =>
    (accountID == null ? 0 : accountID.hashCode) +
    (refreshToken == null ? 0 : refreshToken.hashCode);

  @override
  String toString() => 'RefreshDetails[accountID=$accountID, refreshToken=$refreshToken]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (accountID != null) {
      json['accountID'] = accountID;
    }
    if (refreshToken != null) {
      json['refreshToken'] = refreshToken;
    }
    return json;
  }

  /// Returns a new [RefreshDetails] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static RefreshDetails fromJson(Map<String, dynamic> json) => json == null
    ? null
    : RefreshDetails(
        accountID: json['accountID'],
        refreshToken: json['refreshToken'],
    );

  static List<RefreshDetails> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <RefreshDetails>[]
      : json.map((v) => RefreshDetails.fromJson(v)).toList(growable: true == growable);

  static Map<String, RefreshDetails> mapFromJson(Map<String, dynamic> json) {
    final map = <String, RefreshDetails>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = RefreshDetails.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of RefreshDetails-objects as value to a dart map
  static Map<String, List<RefreshDetails>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<RefreshDetails>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = RefreshDetails.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

