import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/network/dto/base/base_response_dto.dart';
import 'package:withu/feature/account/account.dart';

part 'sns_sign_up_res_dto.freezed.dart';

part 'sns_sign_up_res_dto.g.dart';

typedef SnsSignUpResDto = BaseResponseDto<SnsSignUpResData>;

@freezed
class SnsSignUpResData with _$SnsSignUpResData {
  factory SnsSignUpResData({
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
  }) = _SnsSignUpResData;

  factory SnsSignUpResData.fromJson(Map<String, dynamic> json) =>
      _$SnsSignUpResDataFromJson(json);
}

extension SnsSignUpResDtoEx on SnsSignUpResDto {
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

extension SnsSignUpResDtoMock on SnsSignUpResDto {
  static SnsSignUpResDto success() {
    return SnsSignUpResDto(
      success: true,
      message: '요청 성공',
      data: SnsSignUpResDataMock.success(),
      errorCode: '',
    );
  }

  static SnsSignUpResDto failure() {
    return SnsSignUpResDto(
      success: false,
      message: '요청 실패',
      data: SnsSignUpResDataMock.failure(),
      errorCode: 'SERVER_ERROR',
    );
  }
}

extension SnsSignUpResDataMock on SnsSignUpResData {
  static SnsSignUpResData success() {
    return SnsSignUpResData(
      accessToken: 'tetetet',
      refreshToken: 'tetet',
      expiresIn: 3600,
      tokenType: 'Bearer',
      userId: '9c90d19b-a65c-490a-8e7c-a95d56aed143',
      message: '회원가입이 완료되었습니다',
      isRegistered: true,
      success: true,
    );
  }

  static SnsSignUpResData failure() {
    return SnsSignUpResData(
      accessToken: '',
      refreshToken: '',
      userId: '',
      message: '회원가입에 실패하였습니다.',
      isRegistered: false,
    );
  }
}
