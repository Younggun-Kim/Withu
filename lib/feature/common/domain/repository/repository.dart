import 'package:withu/feature/common/data/data_source/remote/api.dart';
import 'package:withu/feature/common/data/data_source/dto/validate_business/validate_business_req_dto.dart'
    show ValidateBusinessReqDto;

abstract class CommonRepository {
  final CommonApi commonApi;

  CommonRepository({required this.commonApi});

  Future<bool> checkDuplication(ValidateBusinessReqDto dto);
}
