import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/network/dto/base/base_response_dto.dart';
import 'package:withu/feature/account/data/data_sources/dto/token_list/token_list.dart';

part 'email_sign_up_res_dto.freezed.dart';

part 'email_sign_up_res_dto.g.dart';

typedef EmailSignUpResDto = BaseResponseDto<EmailSignUpResData>;

@freezed
class EmailSignUpResData with _$EmailSignUpResData {
  factory EmailSignUpResData({
    @Default('') String token,
    @Default('') String refreshToken,
    @Default('') String userId,
    @Default('') String message,
    TokenListDto? tokenPair,
  }) = _EmailSignUpResData;

  factory EmailSignUpResData.fromJson(Map<String, dynamic> json) =>
      _$EmailSignUpResDataFromJson(json);
}

extension EmailSignUpResDtoMock on EmailSignUpResDto {
  bool get isSuccess => success && data?.token.isNotEmpty == true;

  static EmailSignUpResDto successMock() {
    return EmailSignUpResDto(
      success: true,
      message: '요청 성공',
      data: EmailSignUpResDataMock.success(),
      errorCode: '',
    );
  }

  static EmailSignUpResDto failureMock() {
    return EmailSignUpResDto(
      success: false,
      message: '요청 실패',
      data: EmailSignUpResDataMock.failure(),
      errorCode: 'SERVER_ERROR',
    );
  }
}

extension EmailSignUpResDataMock on EmailSignUpResData {
  static EmailSignUpResData success() {
    return EmailSignUpResData(
      token: 'tetetet',
      refreshToken: 'refresh-token',
      userId: '9c90d19b-a65c-490a-8e7c-a95d56aed143',
      message: '회원가입이 완료되었습니다',
      tokenPair: TokenListDtoMock.mock(),
    );
  }

  static EmailSignUpResData failure() {
    return EmailSignUpResData(
      token: '',
      refreshToken: '',
      userId: '',
      message: '회원가입에 실패하였습니다.',
    );
  }
}
