import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';

part 'phone_value.freezed.dart';

@freezed
class PhoneValue with _$PhoneValue {
  const factory PhoneValue([@Default('') String value]) = _PhoneValue;

  const PhoneValue._();

  bool isValid() => RegExUtil.phonePattern.hasMatch(value);
}
