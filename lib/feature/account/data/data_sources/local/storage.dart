import 'package:shared_preferences/shared_preferences.dart';
import 'package:withu/core/types/login_type.dart';

import 'storage_key.dart';

part 'storage_impl.dart';

abstract class AccountStorage {
  /// Token 불러오기
  Future<String> getToken();

  /// Token 저장
  void setToken({required String token});

  /// Refresh Token 불러오기
  Future<String> getRefreshToken();

  /// Refresh Token 저장
  void setRefreshToken({required String token});

  Future<LoginType> getSignUpType();

  void setSignUpType(LoginType type);

  Future<String> getTempToken();

  void setTempToken(String tempToken);
}
