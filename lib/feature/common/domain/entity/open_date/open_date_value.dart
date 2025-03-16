import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';

part 'open_date_value.freezed.dart';

@freezed
class OpenDateValue with _$OpenDateValue {
  const factory OpenDateValue([@Default('') String value]) = _OpenDateValue;

  const OpenDateValue._();

  bool isValid() => RegExUtil.ymdSlashPattern.hasMatch(value);

  String get onlyDigit => value.onlyNum;
}
