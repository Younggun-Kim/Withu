import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_sign_up_req_dto.freezed.dart';

part 'user_sign_up_req_dto.g.dart';

@freezed
class UserSignUpReqDto with _$UserSignUpReqDto {
  factory UserSignUpReqDto({
    required String name,
    required String birthDate,
    required String gender,
    required String phoneNo,
    required String email,
    required String password,
    required String signUpMethod,
    required String appAcquisitionChannel,
    required bool locationInfoConsent,
    required bool marketingInfoConsent,
  }) = _UserSignUpReqDto;

  factory UserSignUpReqDto.fromJson(Map<String, dynamic> json) =>
      _$UserSignUpReqDtoFromJson(json);
}
