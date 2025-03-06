import 'package:freezed_annotation/freezed_annotation.dart';

part 'validate_business_res_dto.freezed.dart';

part 'validate_business_res_dto.g.dart';

part 'validate_business_res_dto.mock.dart';

@freezed
class ValidateBusinessResDto with _$ValidateBusinessResDto {
  factory ValidateBusinessResDto({
    required String businessNumber,
    required String representativeName,
    required String companyName,
    required String startDate,
    required String valid,
    required String status,
    required bool isRegistered,
  }) = _ValidateBusinessResDto;

  factory ValidateBusinessResDto.fromJson(Map<String, dynamic> json) =>
      _$ValidateBusinessResDtoFromJson(json);
}
