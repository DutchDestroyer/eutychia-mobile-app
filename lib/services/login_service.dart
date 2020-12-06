import 'package:Eutychia/models/new/account_login_data.dart';
import 'package:dartz/dartz.dart';
import 'package:openapi/api.dart';

class LoginService {
  final DefaultApi _apiClient;

  LoginService(this._apiClient);

// Todo need to check here there are an email address and token
// If there are, return true, else, return false
  bool canLoginWithToken() {
    return true;
  }

  Future<Either<Exception, AccountLoginData>> loginWithToken(
      String emailAddress, String token) async {
    var loginBody = LoginBody(
        grantType: LoginBodyGrantTypeEnum.autenthicationtoken_,
        emailAddress: emailAddress,
        refreshToken: token);

    var result = await Task(() => _apiClient.logInWithAccount(loginBody))
        .attempt()
        .run();

    return result.map((data) =>
        AccountLoginData(data.accountID, data.accessToken, data.refreshToken));
  }

  Future<Either<Exception, AccountLoginData>> loginWithPassword(
      String emailAddress, String password) async {
    var loginBody = LoginBody(
        grantType: LoginBodyGrantTypeEnum.password_,
        emailAddress: emailAddress,
        password: password);

    var result = await Task(() => _apiClient.logInWithAccount(loginBody))
        .attempt()
        .run();

    return result.map((data) =>
        AccountLoginData(data.accountID, data.accessToken, data.refreshToken));
  }
}
