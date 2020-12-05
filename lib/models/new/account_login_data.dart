class AccountLoginData {
  final bool isSuccessful;
  final String accountId;
  final String accessToken;
  final String refreshToken;

  AccountLoginData(this.isSuccessful,
      {this.accountId, this.accessToken, this.refreshToken});
}
