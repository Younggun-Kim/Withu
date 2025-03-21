import 'dart:async';
import 'package:withu/feature/common/domain/entity/auth_code/auth_code_value.dart';
import 'package:withu/feature/common/domain/entity/send_auth_code_res/send_auth_code_res_value.dart';
import 'package:withu/feature/common/domain/repository/repository.dart';

part 'phone_auth_usecase.impl.dart';

abstract class PhoneAuthUseCase {
  final CommonRepository commonRepo;

  PhoneAuthUseCase({required this.commonRepo});

  /// 휴대폰 인증번호 발송 요청
  Future<SendAuthCodeResValue> sendAuthCode({required String phone});

  /// 인증번호 검증
  Future<bool> verifyAuthCode({
    required String sessionId,
    required AuthCodeValue authCode,
  });
}
