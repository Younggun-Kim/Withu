import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/network/dto/base/base_response_dto.dart';

part 'company_sign_up_res_dto.freezed.dart';

part 'company_sign_up_res_dto.g.dart';

typedef CompanySignUpResDto = BaseResponseDto<CompanySignUpResData>;

@freezed
class CompanySignUpResData with _$CompanySignUpResData {
  factory CompanySignUpResData({
    required String token,
    required String userId,
    required String message,
  }) = _CompanySignUpResData;

  factory CompanySignUpResData.fromJson(Map<String, dynamic> json) =>
      _$CompanySignUpResDataFromJson(json);
}

extension CompanySignUpResDtoMock on CompanySignUpResDto {
  static CompanySignUpResDto success() {
    return CompanySignUpResDto(
      success: true,
      message: '요청 성공',
      data: CompanySignUpResDataMock.success(),
      error: null,
    );
  }

  static CompanySignUpResDto failure() {
    return CompanySignUpResDto(
      success: false,
      message: '요청 실패',
      data: CompanySignUpResDataMock.failure(),
      error: null,
    );
  }
}

extension CompanySignUpResDataMock on CompanySignUpResData {
  static CompanySignUpResData success() {
    return CompanySignUpResData(
      token: 'tetetet',
      userId: '9c90d19b-a65c-490a-8e7c-a95d56aed143',
      message: '회원가입이 완료되었습니다',
    );
  }

  static CompanySignUpResData failure() {
    return CompanySignUpResData(
      token: '',
      userId: '',
      message: '회원가입에 실패하였습니다.',
    );
  }
}
