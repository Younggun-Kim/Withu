import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';

part 'business_num_value.freezed.dart';

@freezed
class BusinessNumValue with _$BusinessNumValue {
  const factory BusinessNumValue([@Default('') String value]) =
      _BusinessNumValue;

  const BusinessNumValue._();

  bool isValid() => RegExUtil.businessNumPattern.hasMatch(value);
}
