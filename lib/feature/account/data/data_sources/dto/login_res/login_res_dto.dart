import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/network/dto/base/base_response_dto.dart';
import 'package:withu/feature/account/account.dart';

part 'login_res_dto.freezed.dart';

part 'login_res_dto.g.dart';

typedef LoginResDto = BaseResponseDto<LoginResData>;

@freezed
class LoginResData with _$LoginResData {
  factory LoginResData({
    @Default('') String accessToken,
    @Default('') String refreshToken,
    @Default('') String tokenType,
    @Default(0) int expiresIn,
    @Default('') String userId,
    @Default('') String email,
    @Default(UserType.none) UserType userType,
    @Default(false) bool isRegistered,
    @Default('') String tempToken,
    @Default(false) success,
    @Default('') String message,
  }) = _LoginResData;

  factory LoginResData.fromJson(Map<String, dynamic> json) =>
      _$LoginResDataFromJson(json);
}

extension LoginResDtoEx on LoginResDto {
  bool get isSuccessSignUp => success && data?.isRegistered == true;

  bool get hasErrorMessage => !success && message.isNotEmpty;

  bool get hasToken => data?.accessToken.isNotEmpty == true;

  bool get hasRefreshToken => data?.refreshToken.isNotEmpty == true;

  TokenListDto get tokens => TokenListDto(
    accessToken: data?.accessToken ?? '',
    refreshToken: data?.refreshToken ?? '',
    expiresIn: data?.expiresIn ?? 0,
    tokenType: data?.tokenType ?? '',
  );
}

extension LoginResDtoMock on LoginResDto {
  static LoginResDto success() {
    return LoginResDto(
      success: true,
      message: '요청 성공',
      data: LoginResDataMock.success(),
      errorCode: '',
    );
  }

  static LoginResDto failure() {
    return LoginResDto(
      success: false,
      message: '요청 실패',
      data: LoginResDataMock.failure(),
      errorCode: 'SERVER_ERROR',
    );
  }
}

extension LoginResDataMock on LoginResData {
  static LoginResData success() {
    return LoginResData(
      accessToken: 'tetetet',
      refreshToken: 'tetet',
      expiresIn: 3600,
      tokenType: 'Bearer',
      userId: '9c90d19b-a65c-490a-8e7c-a95d56aed143',
      message: '로그인이 완료되었습니다',
      isRegistered: true,
      success: true,
    );
  }

  static LoginResData failure() {
    return LoginResData(
      accessToken: '',
      refreshToken: '',
      userId: '',
      message: '로그인에 실패하였습니다.',
      isRegistered: false,
    );
  }
}
