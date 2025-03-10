import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/feature/account/data/data_sources/dto/apple_login/apple_login_res_dto.dart';

part 'sns_login_res_value.freezed.dart';

@freezed
class SnsLoginResValue with _$SnsLoginResValue {
  const factory SnsLoginResValue({
    /// 회원가입을 위해 tempToken이 필요
    @Default('') String tempToken,
    @Default(false) bool isLoggedIn,
  }) = _SnsLoginResValue;

  const SnsLoginResValue._();
}

extension SnsLoginResValueParser on SnsLoginResValue {
  static SnsLoginResValue fromDto(AppleLoginResDto dto) {
    return SnsLoginResValue(
      isLoggedIn: dto.isLoggedIn,
      tempToken: dto.data?.tempToken ?? '',
    );
  }
}
