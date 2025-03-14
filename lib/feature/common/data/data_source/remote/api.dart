import 'dart:async';

import 'package:dio/dio.dart';
import 'package:withu/core/network/dio_network.dart';
import 'package:withu/core/network/dto/base/base_response_dto.dart';
import 'package:withu/feature/common/common.dart';
import 'package:withu/feature/common/data/data_source/dto/area/area.dart';

part 'api_impl.dart';

enum CommonApiPathType {
  sido('/sido'),
  sgg('/sgg'),
  emd('/emd'),
  validateBusiness('/validate-business'),
  sendAuthCode('/auth/phone/send'),
  verifyAuthCode('/auth/phone/verify');

  final String path;

  const CommonApiPathType(this.path);

  String get fullPath => '/common$path';
}

abstract class CommonApi {
  String get path;

  /// 사업자등록 중복 검증
  FutureOr<ValidateBusinessResDto> postValidateBusiness(
    ValidateBusinessReqDto reqDto,
  );

  /// 인증번호 요청 API
  FutureOr<SendAuthCodeResponseDto> sendAuthCode({required String phone});

  /// 인증번호 검증 API
  FutureOr<VerifyAuthCodeResDto> verifyAuthCode({
    required VerifyAuthCodeReqDto dto,
  });

  /// 시/도 조회
  FutureOr<AreaResDto> getSigo();

  /// 시/군/구 조회
  FutureOr<AreaResDto> getSgg(String sidoCode);

  /// 읍/면/동 조회
  FutureOr<AreaResDto> getEmd(String sggCode);
}
