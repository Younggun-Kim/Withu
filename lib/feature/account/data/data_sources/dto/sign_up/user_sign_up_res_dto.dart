import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/network/dto/base/base_response_dto.dart';

part 'user_sign_up_res_dto.freezed.dart';

part 'user_sign_up_res_dto.g.dart';

typedef UserSignUpResDto = BaseResponseDto<UserSignUpResData>;

@freezed
class UserSignUpResData with _$UserSignUpResData {
  factory UserSignUpResData({
    required String token,
    required String userId,
    required String message,
  }) = _UserSignUpResData;

  factory UserSignUpResData.fromJson(Map<String, dynamic> json) =>
      _$UserSignUpResDataFromJson(json);
}

extension UserSignUpResDtoMock on UserSignUpResDto {
  static UserSignUpResDto success() {
    return UserSignUpResDto(
      success: true,
      message: '요청 성공',
      data: UserSignUpResDataMock.success(),
      errorCode: '',
    );
  }

  static UserSignUpResDto failure() {
    return UserSignUpResDto(
      success: false,
      message: '요청 실패',
      data: UserSignUpResDataMock.failure(),
      errorCode: 'SERVER_ERROR',
    );
  }

  static UserSignUpResDto error() {
    return UserSignUpResDto(
      success: false,
      message: '서버에러',
      data: null,
      errorCode: 'SERVER_ERROR',
    );
  }
}

extension UserSignUpResDataMock on UserSignUpResData {
  static UserSignUpResData success() {
    return UserSignUpResData(
      token: 'tetetet',
      userId: '9c90d19b-a65c-490a-8e7c-a95d56aed143',
      message: '회원가입이 완료되었습니다',
    );
  }

  static UserSignUpResData failure() {
    return UserSignUpResData(token: '', userId: '', message: '회원가입에 실패하였습니다.');
  }
}
