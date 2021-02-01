//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SignUp {
  /// Returns a new [SignUp] instance.
  SignUp({
    @required this.senderAccountID,
    @required this.emailAddress,
  });

  /// account id of the account that invites the new user
  String senderAccountID;

  /// the email address of the newly invited person
  String emailAddress;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SignUp &&
     other.senderAccountID == senderAccountID &&
     other.emailAddress == emailAddress;

  @override
  int get hashCode =>
    (senderAccountID == null ? 0 : senderAccountID.hashCode) +
    (emailAddress == null ? 0 : emailAddress.hashCode);

  @override
  String toString() => 'SignUp[senderAccountID=$senderAccountID, emailAddress=$emailAddress]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (senderAccountID != null) {
      json['senderAccountID'] = senderAccountID;
    }
    if (emailAddress != null) {
      json['emailAddress'] = emailAddress;
    }
    return json;
  }

  /// Returns a new [SignUp] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static SignUp fromJson(Map<String, dynamic> json) => json == null
    ? null
    : SignUp(
        senderAccountID: json['senderAccountID'],
        emailAddress: json['emailAddress'],
    );

  static List<SignUp> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <SignUp>[]
      : json.map((v) => SignUp.fromJson(v)).toList(growable: true == growable);

  static Map<String, SignUp> mapFromJson(Map<String, dynamic> json) {
    final map = <String, SignUp>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = SignUp.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of SignUp-objects as value to a dart map
  static Map<String, List<SignUp>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<SignUp>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = SignUp.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

