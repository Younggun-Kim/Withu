import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';

part 'career_date_value.freezed.dart';

/// 경력 내용
@freezed
class CareerDateValue with _$CareerDateValue {
  const factory CareerDateValue([@Default('') String value]) = _CareerDateValue;

  const CareerDateValue._();

  bool isValid() => RegExUtil.birthDatePattern.hasMatch(value);
}
