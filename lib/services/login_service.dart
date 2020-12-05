import 'package:Eutychia/models/new/account_login_data.dart';
import 'package:openapi/api.dart';

class LoginService {
  final DefaultApi _apiClient;

  LoginService(this._apiClient);

// Todo need to check here there are an email address and token
// If there are, return true, else, return false
  bool canLoginWithToken() {
    return true;
  }

  Future<AccountLoginData> loginWithToken(
      String emailAddress, String token) async {
    var loginBody = LoginBody(
        grantType: LoginBodyGrantTypeEnum.autenthicationtoken_,
        emailAddress: emailAddress,
        refreshToken: token);

    try {
      var data = await _apiClient.logInWithAccount(loginBody);
      return AccountLoginData(true,
          accountId: data.accountID,
          accessToken: data.accessToken,
          refreshToken: data.refreshToken);
    } catch (e) {
      return AccountLoginData(false);
    }
  }

  Future<AccountLoginData> loginWithPassword(
      String emailAddress, String password) async {
    var loginBody = LoginBody(
        grantType: LoginBodyGrantTypeEnum.password_,
        emailAddress: emailAddress,
        password: password);

    try {
      var data = await _apiClient.logInWithAccount(loginBody);
      return AccountLoginData(true,
          accountId: data.accountID,
          accessToken: data.accessToken,
          refreshToken: data.refreshToken);
    } catch (e) {
      return AccountLoginData(false);
    }
  }
}
