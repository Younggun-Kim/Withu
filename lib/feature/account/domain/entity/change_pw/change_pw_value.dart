import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/feature/account/data/data_sources/dto/change_pw/change_pw_req_dto.dart';
import 'package:withu/feature/account/domain/entity/email/email_value.dart';
import 'package:withu/feature/account/domain/entity/name/name_value.dart';
import 'package:withu/feature/account/domain/entity/password/password_value.dart';
import 'package:withu/feature/common/domain/entity/phone/phone_value.dart';

part 'change_pw_value.freezed.dart';

@freezed
class ChangePwValue with _$ChangePwValue {
  const factory ChangePwValue({
    required NameValue name,
    required EmailValue email,
    required PhoneValue phone,
    required PasswordValue password,
  }) = _FindIdResValue;

  const ChangePwValue._();
}

extension ChangePwValueParser on ChangePwValue {
  ChangePwReqDto toDto() {
    return ChangePwReqDto(
      name: name.value,
      email: email.value,
      phoneNo: phone.value,
      newPassword: password.value,
    );
  }
}
