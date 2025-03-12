import 'package:freezed_annotation/freezed_annotation.dart';

part 'sns_sign_up_req_dto.freezed.dart';

part 'sns_sign_up_req_dto.g.dart';

@freezed
class SnsSignUpReqDto with _$SnsSignUpReqDto {
  factory SnsSignUpReqDto({
    required String token,
    required String name,
    required String birthDate,
    required String gender,
    required String phoneNo,
    required String businessNumber,
    required String companyName,
    required String appAcquisitionChannel,
    required bool locationInfoConsent,
    required bool marketingInfoConsent,
  }) = _SnsSignUpReqDto;

  factory SnsSignUpReqDto.fromJson(Map<String, dynamic> json) =>
      _$SnsSignUpReqDtoFromJson(json);
}
