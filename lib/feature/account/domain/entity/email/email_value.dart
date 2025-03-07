import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';

part 'email_value.freezed.dart';

@freezed
class EmailValue with _$EmailValue {
  const factory EmailValue([@Default('') String value]) = _EmailValue;

  const EmailValue._();

  bool isValid() => RegExUtil.emailPattern.hasMatch(value);
}
