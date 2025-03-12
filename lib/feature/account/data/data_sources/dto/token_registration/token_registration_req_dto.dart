import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_registration_req_dto.freezed.dart';

part 'token_registration_req_dto.g.dart';

@freezed
class TokenRegistrationReqDto with _$TokenRegistrationReqDto {
  factory TokenRegistrationReqDto({
    required String token,
    @Default('') String deviceType,
  }) = _TokenRegistrationReqDto;

  factory TokenRegistrationReqDto.fromJson(Map<String, dynamic> json) =>
      _$TokenRegistrationReqDtoFromJson(json);
}
