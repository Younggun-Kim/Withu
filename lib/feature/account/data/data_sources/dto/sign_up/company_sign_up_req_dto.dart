import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_sign_up_req_dto.freezed.dart';

part 'company_sign_up_req_dto.g.dart';

@freezed
class CompanySignUpReqDto with _$CompanySignUpReqDto {
  factory CompanySignUpReqDto({
    required String name,
    required String birthDate,
    required String gender,
    required String phoneNo,
    required String email,
    required String password,
    required String signUpMethod,
    required String businessNumber,
    required String companyName,
    required bool locationInfoConsent,
    required bool marketingInfoConsent,
  }) = _CompanySignUpReqDto;

  factory CompanySignUpReqDto.fromJson(Map<String, dynamic> json) =>
      _$CompanySignUpReqDtoFromJson(json);
}
