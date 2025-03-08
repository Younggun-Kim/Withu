import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_name_value.freezed.dart';

@freezed
class CompanyNameValue with _$CompanyNameValue {
  const factory CompanyNameValue([@Default('') String value]) =
      _CompanyNameValue;

  const CompanyNameValue._();

  bool isValid() => value.length >= 2;
}
