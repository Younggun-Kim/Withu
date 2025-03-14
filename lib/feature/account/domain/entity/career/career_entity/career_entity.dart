import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/common/common.dart';

part 'career_entity.freezed.dart';

/// 경력 Entity
@freezed
class CareerEntity with _$CareerEntity {
  const factory CareerEntity({
    required String id,
    @Default(NameValue()) NameValue name,
    @Default(CareerContentValue()) CareerContentValue content,
    @Default(CompanyNameValue()) CompanyNameValue companyName,
    @Default(CareerDateValue()) CareerDateValue startDate,
    @Default(CareerDateValue()) CareerDateValue endDate,
  }) = _CareerEntity;

  const CareerEntity._();

  bool isValid() =>
      id.isNotEmpty &&
      name.isValid() &&
      content.isValid() &&
      companyName.isValid() &&
      startDate.isValid() &&
      endDate.isValid();
}

extension CareerEntityEx on CareerEntity {
  String get period => '${startDate.value}-${endDate.value}';
}
