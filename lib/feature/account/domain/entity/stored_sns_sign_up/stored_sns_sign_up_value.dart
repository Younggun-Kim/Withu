import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';

part 'stored_sns_sign_up_value.freezed.dart';

@freezed
class StoredSnsSignUpValue with _$StoredSnsSignUpValue {
  const factory StoredSnsSignUpValue({
    required LoginType type,
    required String tempToken,
  }) = _StoredSnsSignUpValue;

  const StoredSnsSignUpValue._();
}
