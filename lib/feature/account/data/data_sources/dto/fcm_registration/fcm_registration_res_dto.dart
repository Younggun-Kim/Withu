import 'package:withu/core/core.dart';

typedef FcmRegistrationResDto = BaseResponseDto<bool>;

extension FcmRegistrationResDtoMock on FcmRegistrationResDto {
  static FcmRegistrationResDto invalid() {
    return FcmRegistrationResDto(
      success: false,
      message: '유효하지 않은 FCM 토큰입니다.',
      data: false,
    );
  }
}
