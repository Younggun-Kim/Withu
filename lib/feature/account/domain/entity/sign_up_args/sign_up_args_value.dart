import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/feature/account/account.dart';

part 'sign_up_args_value.freezed.dart';

@freezed
class SignUpArgsValue with _$SignUpArgsValue {
  const factory SignUpArgsValue({
    @Default(SignUpMethodType.email) SignUpMethodType signUpMethod,
    @Default('') String name,
  }) = _SignUpArgsValue;
}
