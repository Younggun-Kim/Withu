import 'dart:async';

import 'package:withu/feature/common/data/data_source/remote/api.dart';
import 'package:withu/feature/common/data/data_source/dto/dto.dart';

abstract class CommonRepository {
  final CommonApi commonApi;

  CommonRepository({required this.commonApi});

  /// 사업자등록 중복 검사
  /// return: (bool) 중복이면 true
  Future<bool> checkBusinessNumDuplication(ValidateBusinessReqDto dto);

  /// 휴대폰 인증번호 발송 요청
  FutureOr<bool> postAuthCodeSend({required String phone});

  /// 인증번호 검증
  FutureOr<bool> postAuthCodeVerify({
    required String phone,
    required String authCode,
  });
}
