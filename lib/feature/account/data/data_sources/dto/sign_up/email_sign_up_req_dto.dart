import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_sign_up_req_dto.freezed.dart';

part 'email_sign_up_req_dto.g.dart';

@freezed
class EmailSignUpReqDto with _$EmailSignUpReqDto {
  factory EmailSignUpReqDto({
    required String name,
    required String birthDate,
    required String gender,
    required String phoneNo,
    required String email,
    required String password,
    required String signUpMethod,
    required String businessNumber,
    @Default('') String companyName,
    @Default('') String appAcquisitionChannel,
    required bool locationInfoConsent,
    required bool marketingInfoConsent,
  }) = _EmailSignUpReqDto;

  factory EmailSignUpReqDto.fromJson(Map<String, dynamic> json) =>
      _$EmailSignUpReqDtoFromJson(json);
}
