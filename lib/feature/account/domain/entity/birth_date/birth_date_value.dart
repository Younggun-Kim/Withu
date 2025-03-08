import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';

part 'birth_date_value.freezed.dart';

@freezed
class BirthDateValue with _$BirthDateValue {
  const factory BirthDateValue([@Default('') String value]) = _BirthDateValue;

  const BirthDateValue._();

  bool isValid() => RegExUtil.birthDatePattern.hasMatch(value);

  String get formattedDate {
    return value.ymdToYmdSlash();
  }
}
