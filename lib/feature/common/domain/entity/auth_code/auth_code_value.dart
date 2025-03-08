import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_code_value.freezed.dart';

@freezed
class AuthCodeValue with _$AuthCodeValue {
  const factory AuthCodeValue([@Default('') String value]) = _AuthCodeValue;

  const AuthCodeValue._();

  bool isValid() => value.length == 6;
}
