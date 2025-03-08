part of 'send_auth_code_response_dto.dart';

extension SendAuthCodeResponseDtoMock on SendAuthCodeResponseDto {
  /// 성공 응답
  static SendAuthCodeResponseDto success() {
    return SendAuthCodeResponseDto(
      success: true,
      message: '',
      data: SendAuthCodeResponseDataMock.success(),
    );
  }

  /// 실패 응답
  static SendAuthCodeResponseDto failure() {
    return SendAuthCodeResponseDto(success: false, message: '중복된 번호입니다.');
  }
}

extension SendAuthCodeResponseDataMock on SendAuthCodeResponseData {
  static SendAuthCodeResponseData success() {
    return SendAuthCodeResponseData(
      success: true,
      message: '인증 코드 전송 성공',
      sessionId: 'session123456',
    );
  }
}
