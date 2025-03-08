import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/feature/common/data/data_source/dto/send_auth_code/send_auth_code_response_dto.dart';

part 'send_auth_code_res_value.freezed.dart';

@freezed
class SendAuthCodeResValue with _$SendAuthCodeResValue {
  const factory SendAuthCodeResValue({
    required bool isSuccess,
    required String sessionId,
  }) = _SendAuthCodeResValue;

  factory SendAuthCodeResValue.failure() {
    return SendAuthCodeResValue(isSuccess: false, sessionId: '');
  }
}

extension SendAuthCodeResValueMock on SendAuthCodeResValue {
  static SendAuthCodeResValue success() {
    return SendAuthCodeResValue(isSuccess: true, sessionId: 'test-session-id');
  }

  static SendAuthCodeResValue failure() {
    return SendAuthCodeResValue(isSuccess: false, sessionId: '');
  }
}

extension SendAuthCodeResValueParser on SendAuthCodeResValue {
  static SendAuthCodeResValue fromDto(SendAuthCodeResponseData dto) {
    return SendAuthCodeResValue(
      isSuccess: dto.success,
      sessionId: dto.sessionId,
    );
  }
}
