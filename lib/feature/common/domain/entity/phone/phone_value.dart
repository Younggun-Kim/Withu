import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';

part 'phone_value.freezed.dart';

@freezed
class PhoneValue with _$PhoneValue {
  const factory PhoneValue([@Default('') String value]) = _PhoneValue;

  const PhoneValue._();

  bool isValid() => RegExUtil.phonePattern.hasMatch(value);
}

extension PhoneValueEx on PhoneValue {
  String formatPhoneNumber() {
    if (value.length == 11) {
      return '${value.substring(0, 3)}-${value.substring(3, 7)}-${value.substring(7)}';
    } else if (value.length == 10) {
      return '${value.substring(0, 3)}-${value.substring(3, 6)}-${value.substring(6)}';
    } else {
      return value; // 잘못된 경우 원본 반환
    }
  }
}
