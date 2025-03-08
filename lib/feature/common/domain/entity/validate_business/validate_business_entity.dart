import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/feature/common/common.dart';

part 'validate_business_entity.freezed.dart';

@freezed
class ValidateBusinessEntity with _$ValidateBusinessEntity {
  const factory ValidateBusinessEntity({
    required final BusinessNumValue businessNum,
    required final CeoNameValue ceoName,
    required final CompanyNameValue companyName,
    required final OpenDateValue openDate,
  }) = _ValidateBusinessEntity;

  const ValidateBusinessEntity._();
}

extension ValidateBusinessEntityParser on ValidateBusinessEntity {
  ValidateBusinessReqDto toDto() {
    return ValidateBusinessReqDto(
      businessNumber: businessNum.value,
      representativeName: ceoName.value,
      companyName: companyName.value,
      startDate: openDate.onlyDigit,
    );
  }
}
