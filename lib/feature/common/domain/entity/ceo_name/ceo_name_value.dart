import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/utils/utils/regex/regex_util.dart';

part 'ceo_name_value.freezed.dart';

@freezed
class CeoNameValue with _$CeoNameValue {
  const factory CeoNameValue([@Default('') String value]) = _CeoNameValue;

  const CeoNameValue._();

  bool isValid() => RegExUtil.namePattern.hasMatch(value);
}
