import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';

part 'login_request_dto.freezed.dart';

part 'login_request_dto.g.dart';

part 'login_request_dto.mock.dart';

@freezed
class LoginRequestDto with _$LoginRequestDto {
  factory LoginRequestDto({
    required AccountType accountType,
    required LoginType loginType,
    required String loginId,
    required String password,
  }) = _LoginRequestDto;

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestDtoFromJson(json);
}
