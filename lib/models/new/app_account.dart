import 'package:Eutychia/models/new/account_login_data.dart';
import 'package:Eutychia/services/login_service.dart';

class AppAccount {
  final LoginService loginService;
  String emailAddress;
  String refreshToken;
  String accessToken;
  String accountUuid;

  AppAccount(this.loginService);

  void updateLoginData(AccountLoginData loginData) {
    if (loginData.isSuccessful) {
      accountUuid = loginData.accountId;
      refreshToken = loginData.refreshToken;
      accessToken = loginData.accessToken;
    }
  }
}
