import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/utils/resource/string_res.dart';
import 'package:withu/feature/account/account.dart';

part 'company_sign_up_res_entity.freezed.dart';

@freezed
class CompanySignUpResEntity with _$CompanySignUpResEntity {
  factory CompanySignUpResEntity({
    required String token,
    required String message,
  }) = _CompanySignUpResEntity;
}

extension CompanySignUpResEntityEx on CompanySignUpResEntity {
  bool get isSuccess => token.isNotEmpty;
}

extension CompanySignUpResEntityParser on CompanySignUpResEntity {
  static CompanySignUpResEntity fromDto(CompanySignUpResData? dto) {
    if (dto == null) {
      return error();
    }
    return CompanySignUpResEntity(token: dto.token, message: dto.message);
  }

  static CompanySignUpResEntity error() {
    return CompanySignUpResEntity(token: '', message: StringRes.serverError.tr);
  }
}
