import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_pw_req_dto.freezed.dart';

part 'change_pw_req_dto.g.dart';

@freezed
class ChangePwReqDto with _$ChangePwReqDto {
  factory ChangePwReqDto({
    required String name,
    required String email,
    required String phoneNo,
    required String newPassword,
  }) = _ChangePwReqDto;

  factory ChangePwReqDto.fromJson(Map<String, dynamic> json) =>
      _$ChangePwReqDtoFromJson(json);
}
