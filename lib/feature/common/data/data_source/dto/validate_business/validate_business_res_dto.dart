import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';
import 'package:withu/core/network/dto/base/fail_response_dto.dart';

part 'validate_business_res_dto.freezed.dart';

part 'validate_business_res_dto.g.dart';

part 'validate_business_res_dto.mock.dart';

typedef ValidateBusinessResDto = BaseResponseDto<ValidateBusinessResData>;

@freezed
class ValidateBusinessResData with _$ValidateBusinessResData {
  factory ValidateBusinessResData({
    required String businessNumber,
    required String representativeName,
    required String companyName,
    required String startDate,
    required String valid,
    required String status,
    required bool isRegistered,
  }) = _ValidateBusinessResData;

  factory ValidateBusinessResData.fromJson(Map<String, dynamic> json) =>
      _$ValidateBusinessResDataFromJson(json);
}

extension ValidateBusinessResDtoEn on ValidateBusinessResDto {
  bool get isDuplicated => data == null || data?.valid == 'NO';
}
