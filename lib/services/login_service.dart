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

  Future<Either<Exception, LoginTokens>> loginWithToken(
      String emailAddress, String token) async {
    var loginBody = LoginBody(
        grantType: LoginBodyGrantTypeEnum.autenthicationtoken_,
        emailAddress: emailAddress,
        refreshToken: token);

    return await Task(() => _apiClient.logInWithAccount(loginBody))
        .attempt()
        .run();
  }

  Future<Either<dynamic, LoginTokens>> loginWithPassword(
      String emailAddress, String password) async {
    var loginBody = LoginBody(
        grantType: LoginBodyGrantTypeEnum.password_,
        emailAddress: emailAddress,
        password: password);

    return await Task(() => _apiClient.logInWithAccount(loginBody))
        .attempt()
        .run();
  }
}
