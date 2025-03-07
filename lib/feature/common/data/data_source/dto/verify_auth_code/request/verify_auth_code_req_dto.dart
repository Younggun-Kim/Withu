import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_auth_code_req_dto.freezed.dart';

part 'verify_auth_code_req_dto.g.dart';

@freezed
class VerifyAuthCodeReqDto with _$VerifyAuthCodeReqDto {
  factory VerifyAuthCodeReqDto({
    required String phone,
    required String authCode,
  }) = _VerifyAuthCodeReqDto;

  factory VerifyAuthCodeReqDto.fromJson(Map<String, dynamic> json) =>
      _$VerifyAuthCodeReqDtoFromJson(json);
}
