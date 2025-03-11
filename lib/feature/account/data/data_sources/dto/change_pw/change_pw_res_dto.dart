import 'package:withu/core/network/dto/base/base_response_dto.dart';

typedef ChangePwResDto = BaseResponseDto<bool>;

extension ChangePwResDtoMock on ChangePwResDto {
  static ChangePwResDto success() {
    return ChangePwResDto(
      success: true,
      message: '비밀번호가 성공적으로 재설정되었습니다.',
      data: true,
      errorCode: '',
    );
  }

  static ChangePwResDto failure() {
    return ChangePwResDto(
      success: false,
      message: '비밀번호 변경에 실패하였습니다.',
      data: false,
      errorCode: '',
    );
  }
}
