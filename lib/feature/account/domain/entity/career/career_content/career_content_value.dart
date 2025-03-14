import 'package:freezed_annotation/freezed_annotation.dart';

part 'career_content_value.freezed.dart';

/// 경력 내용
@freezed
class CareerContentValue with _$CareerContentValue {
  const factory CareerContentValue([@Default('') String value]) =
      _CareerContentValue;

  const CareerContentValue._();

  bool isValid() => value.isNotEmpty && value.length <= 20;
}
