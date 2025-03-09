import 'package:freezed_annotation/freezed_annotation.dart';

part 'apple_login_req_dto.freezed.dart';

part 'apple_login_req_dto.g.dart';

@freezed
class AppleLoginReqDto with _$AppleLoginReqDto {
  factory AppleLoginReqDto({
    required String idToken,
    required String firstName,
    required String lastName,
  }) = _AppleLoginReqDto;

  factory AppleLoginReqDto.fromJson(Map<String, dynamic> json) =>
      _$AppleLoginReqDtoFromJson(json);
}
