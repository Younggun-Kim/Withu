part of 'storage.dart';

class AccountStorageImpl implements AccountStorage {
  /// reset
  @override
  Future reset() async {
    final instance = await SharedPreferences.getInstance();
    instance.clear();
  }

  /// Token 불러오기
  @override
  Future<String> getToken() async {
    return SharedPreferences.getInstance().then(
      (preference) => preference.getString(AccountStorageKey.token.name) ?? '',
    );
  }

  /// Token 저장
  @override
  void setToken({required String token}) {
    SharedPreferences.getInstance().then(
      (preference) => preference.setString(AccountStorageKey.token.name, token),
    );
  }

  /// Refresh Token 불러오기
  @override
  Future<String> getRefreshToken() {
    return SharedPreferences.getInstance().then(
      (preference) =>
          preference.getString(AccountStorageKey.refreshToken.name) ?? '',
    );
  }

  /// Refresh Token 저장
  @override
  void setRefreshToken({required String token}) {
    SharedPreferences.getInstance().then(
      (preference) =>
          preference.setString(AccountStorageKey.refreshToken.name, token),
    );
  }

  @override
  Future<LoginType> getSignUpType() async {
    final signUpType = await SharedPreferences.getInstance().then(
      (preference) =>
          preference.getString(AccountStorageKey.signUpType.name) ?? '',
    );

    return LoginType.from(signUpType);
  }

  @override
  void setSignUpType(LoginType type) {
    SharedPreferences.getInstance().then(
      (preference) => preference.setString(
        AccountStorageKey.signUpType.name,
        type.serverKey,
      ),
    );
  }

  @override
  Future<String> getTempToken() async {
    return SharedPreferences.getInstance().then(
      (preference) => preference.getString(AccountStorageKey.token.name) ?? '',
    );
  }

  @override
  void setTempToken(String tempToken) {
    SharedPreferences.getInstance().then(
      (preference) =>
          preference.setString(AccountStorageKey.token.name, tempToken),
    );
  }
}
