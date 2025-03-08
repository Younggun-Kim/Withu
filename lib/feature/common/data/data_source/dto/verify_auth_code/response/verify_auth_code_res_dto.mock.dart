part of 'verify_auth_code_res_dto.dart';

extension VerifyAuthCodeResDtoMock on VerifyAuthCodeResDto {
  /// 성공 응답
  static VerifyAuthCodeResDto success() {
    return VerifyAuthCodeResDto(
      success: true,
      message: '',
      data: VerifyAuthCodeResDataMock.success(),
    );
  }

  /// 실패 응답
  static VerifyAuthCodeResDto failure() {
    return VerifyAuthCodeResDto(success: false, message: '인증 실패');
  }
}

extension VerifyAuthCodeResDataMock on VerifyAuthCodeResData {
  static VerifyAuthCodeResData success() {
    return VerifyAuthCodeResData(
      success: true,
      message: '인증이 완료되었습니다.',
      userId: '01049212480',
    );
  }

  static VerifyAuthCodeResData failure() {
    return VerifyAuthCodeResData(success: false, message: '인증 실패.', userId: '');
  }
}
