import 'package:Eutychia/models/new/account_login_data.dart';
import 'package:Eutychia/models/new/app_account.dart';
import 'package:dartz/dartz.dart';

class LoginScreenViewModel {
  final AppAccount _appAccount;

  LoginScreenViewModel(this._appAccount);

  Future<Either<Exception, AccountLoginData>> performLoginWithToken() async {
    var result = await _appAccount.loginService.loginWithToken(
        _appAccount.emailAddress, _appAccount.loginData.refreshToken);

    return result.map(
        (a) => AccountLoginData(a.accountID, a.accessToken, a.refreshToken));
  }

  Future<Either<dynamic, AccountLoginData>> performLoginWithPassword(
      String emailAddress, String password) async {
    var result = await _appAccount.loginService
        .loginWithPassword(emailAddress, password);

    return result.map(
        (a) => AccountLoginData(a.accountID, a.accessToken, a.refreshToken));
  }

  bool canLoginWithToken() {
    return _appAccount.loginService.canLoginWithToken();
  }

  void loginSucceeded(AccountLoginData loginData, String emailAddress) {
    if (emailAddress.isNotEmpty) {
      _appAccount.emailAddress = emailAddress;
    }
    _appAccount.updateLoginData(loginData);
  }
}
