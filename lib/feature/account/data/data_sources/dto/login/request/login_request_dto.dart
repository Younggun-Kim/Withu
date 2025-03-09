import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';

part 'login_request_dto.freezed.dart';

part 'login_request_dto.g.dart';

part 'login_request_dto.mock.dart';

@freezed
class LoginRequestDto with _$LoginRequestDto {
  factory LoginRequestDto({
    required String email,
    required String password,
    required String accountType,
  }) = _LoginRequestDto;

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestDtoFromJson(json);
}
