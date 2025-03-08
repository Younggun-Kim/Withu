import 'package:freezed_annotation/freezed_annotation.dart';

part 'ceo_name_value.freezed.dart';

@freezed
class CeoNameValue with _$CeoNameValue {
  const factory CeoNameValue([@Default('') String value]) = _CeoNameValue;

  const CeoNameValue._();

  bool isValid() => value.length >= 2;
}
