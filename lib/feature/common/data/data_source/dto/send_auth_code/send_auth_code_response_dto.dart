import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';

part 'send_auth_code_response_dto.freezed.dart';

part 'send_auth_code_response_dto.g.dart';

part 'send_auth_code_response_dto.mock.dart';

typedef SendAuthCodeResponseDto = BaseResponseDto<SendAuthCodeResponseData>;

/// 휴대폰 인증번호 전송 응답 모델
@freezed
class SendAuthCodeResponseData with _$SendAuthCodeResponseData {
  factory SendAuthCodeResponseData({
    required bool success,
    required String message,
    @Default('') String sessionId,
  }) = _SendAuthCodeResponseData;

  factory SendAuthCodeResponseData.fromJson(Map<String, dynamic> json) =>
      _$SendAuthCodeResponseDataFromJson(json);
}
