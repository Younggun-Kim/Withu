import 'package:freezed_annotation/freezed_annotation.dart';

part 'fcm_registration_req_dto.freezed.dart';

part 'fcm_registration_req_dto.g.dart';

@freezed
class FcmRegistrationReqDto with _$FcmRegistrationReqDto {
  factory FcmRegistrationReqDto({
    required String token,
    required String deviceInfo,
  }) = _FcmRegistrationReqDto;

  factory FcmRegistrationReqDto.fromJson(Map<String, dynamic> json) =>
      _$FcmRegistrationReqDtoFromJson(json);
}
