part of 'storage.dart';

class AccountStorageImpl implements AccountStorage {
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
}
