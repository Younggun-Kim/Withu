import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';

part 'apple_login_res_dto.freezed.dart';

part 'apple_login_res_dto.g.dart';

typedef AppleLoginResDto = BaseResponseDto<AppleLoginResData>;

@freezed
class AppleLoginResData with _$AppleLoginResData {
  factory AppleLoginResData({
    @Default('') token,
    @Default('') refreshToken,
    TokenListDto? tokenPair,
    @Default('') tempToken,
    @Default('') userId,
    @Default('') email,
    required bool isRegistered,
    @Default('') message,
  }) = _AppleLoginResData;

  factory AppleLoginResData.fromJson(Map<String, dynamic> json) =>
      _$AppleLoginResDataFromJson(json);
}

extension AppleLoginResDtoMock on AppleLoginResDto {
  bool get hasMessage => data?.message.isNotEmpty == true;

  bool get hasToken => data?.token?.isNotEmpty == true;

  bool get isLoggedIn => data?.isRegistered == true && hasToken;

  static AppleLoginResDto success() {
    return AppleLoginResDto(
      success: true,
      message: '',
      errorCode: '',
      data: AppleLoginResData(
        tempToken: '',
        token: 'accesstokenj-tetete',
        refreshToken: 'refreshtoken-tetete',
        userId: '12312312312321',
        isRegistered: true,
        message: '로그인 성공',
      ),
    );
  }

  static AppleLoginResDto failure() {
    return AppleLoginResDto(
      success: true,
      message: '',
      errorCode: '',
      data: AppleLoginResData(
        tempToken: 'test-token',
        token: '',
        refreshToken: '',
        userId: '',
        isRegistered: false,
        email: "user@example.com",
        message: '회원가입을 완료하려면 휴대폰 인증이 필요합니다.',
      ),
    );
  }

  static AppleLoginResDto error() {
    return AppleLoginResDto(
      success: false,
      message: '서버 에러',
      errorCode: 'SERVER_ERROR',
      data: null,
    );
  }
}
