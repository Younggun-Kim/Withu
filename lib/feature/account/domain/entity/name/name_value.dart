import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/utils/utils/regex/regex_util.dart';

part 'name_value.freezed.dart';

@freezed
class NameValue with _$NameValue {
  const factory NameValue([@Default('') String value]) = _NameValue;

  const NameValue._();

  bool isValid() => RegExUtil.namePattern.hasMatch(value);
}
