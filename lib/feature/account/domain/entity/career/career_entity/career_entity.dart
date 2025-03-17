// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nanoid/nanoid.dart';
import 'package:withu/core/utils/library/logger/logger.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/common/common.dart';

part 'career_entity.freezed.dart';

part 'career_entity_parser.dart';

typedef CareerEntities = List<CareerEntity>;

/// 경력 Entity
@freezed
class CareerEntity with _$CareerEntity {
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

  factory CareerEntity.deepCopy(CareerEntity other) {
    final temp = CareerEntity();
    return temp.copyWith(
      id: other.id,
      name: other.name,
      content: other.content,
      companyName: other.companyName,
      startDate: other.startDate,
      endDate: other.endDate,
    );
  }

  bool isValid() {
    return id.isNotEmpty &&
        name.isValid() &&
        content.isValid() &&
        companyName.isValid() &&
        startDate.isValid() &&
        endDate.isValid();
  }
}

extension CareerEntityEx on CareerEntity {
  String get period => '${startDate.value}-${endDate.value}';

  bool get isEmptyEndDate => endDate.value.isEmpty;

  bool isEqual(CareerEntity other) {
    return id == other.id;
  }

  bool isAfter() {
    try {
      return startDate.getDate().isAfter(endDate.getDate());
    } catch (e) {
      return false;
    }
  }

  bool isBefore() {
    try {
      logger.i(
        '${startDate.getDate().isBefore(endDate.getDate())}  - ${endDate.getDate().isBefore(startDate.getDate())} -   - ${startDate.getDate()}   -  ${endDate.getDate()}',
      );
      return endDate.getDate().isBefore(startDate.getDate());
    } catch (e) {
      return false;
    }
  }
}
