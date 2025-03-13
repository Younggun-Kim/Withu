import 'package:freezed_annotation/freezed_annotation.dart';

part 'introduction_value.freezed.dart';

/// 자기소개
@freezed
class IntroductionValue with _$IntroductionValue {
  const factory IntroductionValue([@Default('') String value]) =
      _IntroductionValue;

  const IntroductionValue._();

  bool isValid() => value.isNotEmpty && value.length <= 50;
}
