import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/network/dto/base/base_response_dto.dart';
import 'package:withu/feature/account/account.dart';

part 'sns_sign_up_res_dto.freezed.dart';

part 'sns_sign_up_res_dto.g.dart';

typedef SnsSignUpResDto = BaseResponseDto<SnsSignUpResData>;

@freezed
class SnsSignUpResData with _$SnsSignUpResData {
  factory SnsSignUpResData({
    required String token,
    required String refreshToken,
    required TokenListDto tokenPair,
    required String userId,
    required bool isRegistered,
    required String message,
  }) = _SnsSignUpResData;

  factory SnsSignUpResData.fromJson(Map<String, dynamic> json) =>
      _$SnsSignUpResDataFromJson(json);
}

extension SnsSignUpResDtoEx on SnsSignUpResDto {
  bool get isSuccessSignUp => success && data?.isRegistered == true;
  bool get hasErrorMessage => !success && message.isNotEmpty;
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
      token: 'tetetet',
      refreshToken: 'tetet',
      tokenPair: TokenListDtoMock.mock(),
      userId: '9c90d19b-a65c-490a-8e7c-a95d56aed143',
      message: '회원가입이 완료되었습니다',
      isRegistered: true,
    );
  }

  static SnsSignUpResData failure() {
    return SnsSignUpResData(
      token: '',
      refreshToken: '',
      tokenPair: TokenListDtoMock.mock(),
      userId: '',
      message: '회원가입에 실패하였습니다.',
      isRegistered: false,
    );
  }
}
