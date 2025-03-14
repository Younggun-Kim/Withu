import 'dart:async';

import 'package:withu/feature/common/data/data_source/dto/area/area_res_dto.dart';
import 'package:withu/feature/common/data/data_source/remote/api.dart';
import 'package:withu/feature/common/data/data_source/dto/dto.dart';
import 'package:withu/feature/common/domain/entity/send_auth_code_res/send_auth_code_res_value.dart';

abstract class CommonRepository {
  final CommonApi commonApi;

  CommonRepository({required this.commonApi});

  /// 사업자등록 중복 검사
  ///
  /// return: (bool) true - 등록가능
  Future<bool> checkBusinessNumDuplication(ValidateBusinessReqDto dto);

  /// 휴대폰 인증번호 발송 요청
  FutureOr<SendAuthCodeResValue> postAuthCodeSend({required String phone});

  /// 인증번호 검증
  FutureOr<bool> postAuthCodeVerify({
    required String sessionId,
    required String authCode,
  });

  /// 시/도 조회
  FutureOr<AreaResDto> getSido();

  /// 시/군/구 조회
  FutureOr<AreaResDto> getSgg(String sidoCode);

  /// 읍/면/동 조회
  FutureOr<AreaResDto> getEmd(String sggCode);
}
