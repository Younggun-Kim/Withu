import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/utils/regex/regex.dart';

part 'password_value.freezed.dart';

/// 비밀번호 Value Object
@freezed
class PasswordValue with _$PasswordValue {
  const factory PasswordValue([@Default('') String value]) = _PasswordValue;

  const PasswordValue._();
}

extension PasswordValueEx on PasswordValue {
  bool isValid() => RegExUtil.passwordPattern.hasMatch(value);
}
