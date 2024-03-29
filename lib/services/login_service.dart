import 'package:Eutychia/api/lib/api.dart';
import 'package:dartz/dartz.dart';

class LoginService {
  final DefaultApi _apiClient;

  LoginService(this._apiClient);

// Todo need to check here there are an email address and token
// If there are, return true, else, return false
  bool canLoginWithToken() {
    return true;
  }

  Future<Either<dynamic, AccountDetails>> loginWithToken(
      String emailAddress, String token) async {
    var loginBody = LoginAccount(
        grantType: LoginAccountGrantTypeEnum.autenthicationtoken_,
        emailAddress: emailAddress,
        accessToken: token);

    return await Task(() => _apiClient.logInWithAccount(loginBody))
        .attempt()
        .run();
  }

  Future<Either<dynamic, AccountDetails>> loginWithPassword(
      String emailAddress, String password) async {
    var loginBody = LoginAccount(
        grantType: LoginAccountGrantTypeEnum.password_,
        emailAddress: emailAddress,
        password: password);

    return await Task(() => _apiClient.logInWithAccount(loginBody))
        .attempt()
        .run();
  }
}
