import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';

part 'open_date_value.freezed.dart';

@freezed
class OpenDateValue with _$OpenDateValue {
  const factory OpenDateValue([@Default('') String value]) = _OpenDateValue;

  const OpenDateValue._();

  // DateFormat에서는 yyyyMMdd 검사가 실패해서 /를 포함해서 저장한다.
  bool isValid() => value.isDateFormat('yyyy/MM/dd');

  String get onlyDigit => value.onlyNum;
}
