//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AccountDetails {
  /// Returns a new [AccountDetails] instance.
  AccountDetails({
    @required this.accountID,
    @required this.accessToken,
    @required this.refreshToken,
  });

  /// The account id.
  String accountID;

  /// The access token.
  String accessToken;

  /// The refresh token.
  String refreshToken;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AccountDetails &&
     other.accountID == accountID &&
     other.accessToken == accessToken &&
     other.refreshToken == refreshToken;

  @override
  int get hashCode =>
    (accountID == null ? 0 : accountID.hashCode) +
    (accessToken == null ? 0 : accessToken.hashCode) +
    (refreshToken == null ? 0 : refreshToken.hashCode);

  @override
  String toString() => 'AccountDetails[accountID=$accountID, accessToken=$accessToken, refreshToken=$refreshToken]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (accountID != null) {
      json['accountID'] = accountID;
    }
    if (accessToken != null) {
      json['accessToken'] = accessToken;
    }
    if (refreshToken != null) {
      json['refreshToken'] = refreshToken;
    }
    return json;
  }

  /// Returns a new [AccountDetails] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static AccountDetails fromJson(Map<String, dynamic> json) => json == null
    ? null
    : AccountDetails(
        accountID: json['accountID'],
        accessToken: json['accessToken'],
        refreshToken: json['refreshToken'],
    );

  static List<AccountDetails> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <AccountDetails>[]
      : json.map((v) => AccountDetails.fromJson(v)).toList(growable: true == growable);

  static Map<String, AccountDetails> mapFromJson(Map<String, dynamic> json) {
    final map = <String, AccountDetails>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = AccountDetails.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of AccountDetails-objects as value to a dart map
  static Map<String, List<AccountDetails>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<AccountDetails>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = AccountDetails.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

