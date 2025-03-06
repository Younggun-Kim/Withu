import 'package:freezed_annotation/freezed_annotation.dart';

part 'validate_business_req_dto.freezed.dart';

part 'validate_business_req_dto.g.dart';

@freezed
class ValidateBusinessReqDto with _$ValidateBusinessReqDto {
  factory ValidateBusinessReqDto({
    required String businessNumber,
    required String representativeName,
    required String companyName,
    required String startDate,
  }) = _ValidateBusinessReqDto;

  factory ValidateBusinessReqDto.fromJson(Map<String, dynamic> json) =>
      _$ValidateBusinessReqDtoFromJson(json);
}
