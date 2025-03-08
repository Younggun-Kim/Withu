import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';

part 'verify_auth_code_res_dto.freezed.dart';

part 'verify_auth_code_res_dto.g.dart';

part 'verify_auth_code_res_dto.mock.dart';

typedef VerifyAuthCodeResDto = BaseResponseDto<VerifyAuthCodeResData>;

/// 휴대폰 인증번호 확인 응답 모델
@freezed
class VerifyAuthCodeResData with _$VerifyAuthCodeResData {
  factory VerifyAuthCodeResData({
    required bool success,
    required String message,
    required String userId,
  }) = _VerifyAuthCodeResData;

  factory VerifyAuthCodeResData.fromJson(Map<String, dynamic> json) =>
      _$VerifyAuthCodeResDataFromJson(json);
}
