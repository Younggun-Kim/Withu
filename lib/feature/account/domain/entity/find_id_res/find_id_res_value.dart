import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/feature/account/data/data_sources/dto/find_id/find_id_res_dto.dart';
import 'package:withu/feature/account/domain/type/sign_up_method_type.dart';

part 'find_id_res_value.freezed.dart';

@freezed
class FindIdResValue with _$FindIdResValue {
  const factory FindIdResValue({
    required bool success,
    required String email,
    required SignUpMethodType signUpMethod,
  }) = _FindIdResValue;

  const FindIdResValue._();
}

extension FindIdResValueParser on FindIdResValue {
  static FindIdResValue fromDto(FindIdResData? dto) {
    return FindIdResValue(
      success: dto?.success ?? false,
      email: dto?.email ?? '',
      signUpMethod: dto?.signUpMethod ?? SignUpMethodType.none,
    );
  }
}
