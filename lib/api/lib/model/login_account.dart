//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.0

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class LoginAccount {
  /// Returns a new [LoginAccount] instance.
  LoginAccount({
    @required this.grantType,
    @required this.emailAddress,
    this.password,
    this.accessToken,
  });

  /// type of grant type to log in with
  LoginAccountGrantTypeEnum grantType;

  /// account email address to log in with
  String emailAddress;

  /// password of the account to log in with
  String password;

  /// accesstoken of the account to log in with
  String accessToken;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LoginAccount &&
     other.grantType == grantType &&
     other.emailAddress == emailAddress &&
     other.password == password &&
     other.accessToken == accessToken;

  @override
  int get hashCode =>
    (grantType == null ? 0 : grantType.hashCode) +
    (emailAddress == null ? 0 : emailAddress.hashCode) +
    (password == null ? 0 : password.hashCode) +
    (accessToken == null ? 0 : accessToken.hashCode);

  @override
  String toString() => 'LoginAccount[grantType=$grantType, emailAddress=$emailAddress, password=$password, accessToken=$accessToken]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (grantType != null) {
      json['grantType'] = grantType;
    }
    if (emailAddress != null) {
      json['emailAddress'] = emailAddress;
    }
    if (password != null) {
      json['password'] = password;
    }
    if (accessToken != null) {
      json['accessToken'] = accessToken;
    }
    return json;
  }

  /// Returns a new [LoginAccount] instance and imports its values from
  /// [json] if it's non-null, null if [json] is null.
  static LoginAccount fromJson(Map<String, dynamic> json) => json == null
    ? null
    : LoginAccount(
        grantType: LoginAccountGrantTypeEnum.fromJson(json['grantType']),
        emailAddress: json['emailAddress'],
        password: json['password'],
        accessToken: json['accessToken'],
    );

  static List<LoginAccount> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <LoginAccount>[]
      : json.map((v) => LoginAccount.fromJson(v)).toList(growable: true == growable);

  static Map<String, LoginAccount> mapFromJson(Map<String, dynamic> json) {
    final map = <String, LoginAccount>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) => map[key] = LoginAccount.fromJson(v));
    }
    return map;
  }

  // maps a json object with a list of LoginAccount-objects as value to a dart map
  static Map<String, List<LoginAccount>> mapListFromJson(Map<String, dynamic> json, {bool emptyIsNull, bool growable,}) {
    final map = <String, List<LoginAccount>>{};
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic v) {
        map[key] = LoginAccount.listFromJson(v, emptyIsNull: emptyIsNull, growable: growable);
      });
    }
    return map;
  }
}

/// type of grant type to log in with
class LoginAccountGrantTypeEnum {
  /// Instantiate a new enum with the provided [value].
  const LoginAccountGrantTypeEnum._(this.value);

  /// The underlying value of this enum member.
  final String value;

  @override
  bool operator ==(Object other) => identical(this, other) ||
      other is LoginAccountGrantTypeEnum && other.value == value ||
      other is String && other == value;

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() => value;

  String toJson() => value;

  static const password_ = LoginAccountGrantTypeEnum._('password');
  static const autenthicationtoken_ = LoginAccountGrantTypeEnum._('autenthicationToken');

  /// List of all possible values in this [enum][LoginAccountGrantTypeEnum].
  static const values = <LoginAccountGrantTypeEnum>[
    password_,
    autenthicationtoken_,
  ];

  static LoginAccountGrantTypeEnum fromJson(dynamic value) =>
    LoginAccountGrantTypeEnumTypeTransformer().decode(value);

  static List<LoginAccountGrantTypeEnum> listFromJson(List<dynamic> json, {bool emptyIsNull, bool growable,}) =>
    json == null || json.isEmpty
      ? true == emptyIsNull ? null : <LoginAccountGrantTypeEnum>[]
      : json
          .map((value) => LoginAccountGrantTypeEnum.fromJson(value))
          .toList(growable: true == growable);
}

/// Transformation class that can [encode] an instance of [LoginAccountGrantTypeEnum] to String,
/// and [decode] dynamic data back to [LoginAccountGrantTypeEnum].
class LoginAccountGrantTypeEnumTypeTransformer {
  const LoginAccountGrantTypeEnumTypeTransformer._();

  factory LoginAccountGrantTypeEnumTypeTransformer() => _instance ??= LoginAccountGrantTypeEnumTypeTransformer._();

  String encode(LoginAccountGrantTypeEnum data) => data.value;

  /// Decodes a [dynamic value][data] to a LoginAccountGrantTypeEnum.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  LoginAccountGrantTypeEnum decode(dynamic data, {bool allowNull}) {
    switch (data) {
      case 'password': return LoginAccountGrantTypeEnum.password_;
      case 'autenthicationToken': return LoginAccountGrantTypeEnum.autenthicationtoken_;
      default:
        if (allowNull == false) {
          throw ArgumentError('Unknown enum value to decode: $data');
        }
    }
    return null;
  }

  /// Singleton [LoginAccountGrantTypeEnumTypeTransformer] instance.
  static LoginAccountGrantTypeEnumTypeTransformer _instance;
}

