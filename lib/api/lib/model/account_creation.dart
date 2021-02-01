//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AccountCreation {
  /// Returns a new [AccountCreation] instance.
  AccountCreation({
    @required this.firstName,
    @required this.lastName,
    @required this.senderAccountID,
    @required this.emailAddress,
  });

  /// first name of the new user
  String firstName;

  /// last name of the new user
  String lastName;

  /// the id of the account that invited the new user
  String senderAccountID;

  
  String emailAddress;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AccountCreation &&
     other.firstName == firstName &&
     other.lastName == lastName &&
     other.senderAccountID == senderAccountID &&
     other.emailAddress == emailAddress;

  @override
  int get hashCode =>
    (firstName == null ? 0 : firstName.hashCode) +
    (lastName == null ? 0 : lastName.hashCode) +
    (senderAccountID == null ? 0 : senderAccountID.hashCode) +
    (emailAddress == null ? 0 : emailAddress.hashCode);

  @override
  String toString() => 'AccountCreation[firstName=$firstName, lastName=$lastName, senderAccountID=$senderAccountID, emailAddress=$emailAddress]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (firstName != null) {
      json['firstName'] = firstName;
    }
    if (lastName != null) {
      json['lastName'] = lastName;
    }
    if (senderAccountID != null) {
      json['senderAccountID'] = senderAccountID;
    }
    if (emailAddress != null) {
      json['emailAddress'] = emailAddress;
    }
    return json;
  }

  /// Returns a new [AccountCreation] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static AccountCreation fromJson(Map<String, dynamic> json) => json == null
    ? null
    : AccountCreation(
        firstName: json['firstName'],
        lastName: json['lastName'],
        senderAccountID: json['senderAccountID'],
        emailAddress: json['emailAddress'],
    );

  static List<AccountCreation> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <AccountCreation>[]
      : json.map((v) => AccountCreation.fromJson(v)).toList(growable: true == growable);

  static Map<String, AccountCreation> mapFromJson(Map<String, dynamic> json) {
    final map = <String, AccountCreation>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = AccountCreation.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of AccountCreation-objects as value to a dart map
  static Map<String, List<AccountCreation>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<AccountCreation>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = AccountCreation.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

