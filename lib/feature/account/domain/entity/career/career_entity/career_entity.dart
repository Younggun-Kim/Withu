// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nanoid/nanoid.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/common/common.dart';

import '../../../../../../core/utils/library/logger/logger.dart';

part 'career_entity.freezed.dart';

part 'career_entity_parser.dart';

typedef CareerEntities = List<CareerEntity>;

/// 경력 Entity
@freezed
class CareerEntity with _$CareerEntity, EquatableMixin {
  const factory CareerEntity({
    @Default('') String id,
    @Default(NameValue()) NameValue name,
    @Default(CareerContentValue()) CareerContentValue content,
    @Default(CompanyNameValue()) CompanyNameValue companyName,
    @Default(CareerDateValue()) CareerDateValue startDate,
    @Default(CareerDateValue()) CareerDateValue endDate,
    @Default(true) bool isTemp,
  }) = _CareerEntity;

  const CareerEntity._();

  factory CareerEntity.temp() => CareerEntity(id: nanoid());

  bool isValid() =>
      id.isNotEmpty &&
      name.isValid() &&
      content.isValid() &&
      companyName.isValid() &&
      startDate.isValid() &&
      endDate.isValid();

  @override
  List<Object?> get props => [id];
}

extension CareerEntityEx on CareerEntity {
  String get period => '${startDate.value}-${endDate.value}';

  bool get isEmptyEndDate => endDate.value.isEmpty;

  bool isAfter() {
    try {
      return startDate.getDate().isAfter(endDate.getDate());
    } catch (e) {
      logger.e(e);
      return false;
    }
  }

  bool isBefore() {
    try {
      return endDate.getDate().isBefore(startDate.getDate());
    } catch (e) {
      logger.e(e);
      return false;
    }
  }
}
