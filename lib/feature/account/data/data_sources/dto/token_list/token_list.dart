import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';

part 'token_list.freezed.dart';

part 'token_list.g.dart';

@freezed
class TokenListDto with _$TokenListDto {
  factory TokenListDto({
    @Default('') String accessToken,
    @Default('') String refreshToken,
    @Default(0) int expiresIn,
    @Default('') String tokenType,
    UserType? accountType,
  }) = _TokenListDto;

  factory TokenListDto.fromJson(Map<String, dynamic> json) =>
      _$TokenListDtoFromJson(json);
}

extension TokenListDtoMock on TokenListDto {
  static TokenListDto mock() {
    return TokenListDto(
      accessToken: 'mock-access-token',
      refreshToken: 'mock-refresh-token',
      tokenType: 'Bearer',
      expiresIn: 3600,
    );
  }

  static TokenListDto empty() {
    return TokenListDto();
  }
}
