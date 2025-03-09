import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/utils/regex/regex_util.dart';

part 'company_name_value.freezed.dart';

@freezed
class CompanyNameValue with _$CompanyNameValue {
  const factory CompanyNameValue([@Default('') String value]) =
      _CompanyNameValue;

  const CompanyNameValue._();

  bool isValid() => RegExUtil.namePattern.hasMatch(value);
}
