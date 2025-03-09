import 'package:shared_preferences/shared_preferences.dart';

import 'storage_key.dart';

part 'storage_impl.dart';

abstract class AccountStorage {
  /// Token 불러오기
  Future<String> getToken();

  /// Token 저장
  void setToken({required String token});
}
