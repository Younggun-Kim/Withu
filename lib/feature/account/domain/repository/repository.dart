import 'dart:async';

import 'package:withu/core/core.dart';
import 'package:withu/feature/account/data/data.dart';

abstract class AccountRepository {
  AccountRepository({required this.accountApi, required this.accountStorage});
  final AccountStorage accountStorage;

  final AccountApi accountApi;

  /// 로그인 API 호출
  FutureOr<ApiResponse<LoginResponseDto>> login({
    required LoginRequestDto requestData,
  });

  /// Session Id Storage 에 저장
  void storeSessionId({required String id});

  /// Session Id Storage 에 조회
  Future<String> getSessionId();
}
