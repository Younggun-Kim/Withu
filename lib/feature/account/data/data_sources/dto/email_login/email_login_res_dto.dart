import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';

part 'email_login_res_dto.freezed.dart';

part 'email_login_res_dto.g.dart';

typedef EmailLoginResDto = BaseResponseDto<EmailLoginResData>;

@freezed
class EmailLoginResData with _$EmailLoginResData {
  factory EmailLoginResData({
    required String token,
    required String userId,
    required String message,
    AccountType? accountType,
  }) = _EmailLoginResData;

  factory EmailLoginResData.fromJson(Map<String, dynamic> json) =>
      _$EmailLoginResDataFromJson(json);
}

extension EmailLoginResDtoMock on EmailLoginResDto {
  bool get hasToken => data?.token.isNotEmpty == true;

  bool get isSuccessLogin => this.success && hasToken;

  static EmailLoginResDto success() {
    return EmailLoginResDto(
      success: true,
      message: '로그인 성공',
      data: EmailLoginResData(
        token: 'test-token',
        userId: 'test-user-id',
        message: '',
      ),
      errorCode: '',
    );
  }

  static EmailLoginResDto error() {
    return EmailLoginResDto(
      success: false,
      message: '서버 에러',
      data: null,
      errorCode: 'SERVER_ERROR',
    );
  }
}
