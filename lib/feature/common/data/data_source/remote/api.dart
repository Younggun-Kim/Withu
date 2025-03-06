import 'dart:async';

import 'package:withu/core/network/api_response.dart';
import 'package:withu/core/network/dio_network.dart';
import 'package:withu/feature/common/data/data_source/dto/validate_business/validate_business.dart';

part 'api_impl.dart';

enum CommonApiPathType { validateBusiness }

abstract class CommonApi {
  String get path;

  late Map<CommonApiPathType, String> paths;

  /// 사업자등록 중복 검증
  FutureOr<ApiResponse<ValidateBusinessResDto>> postValidateBusiness(
    ValidateBusinessReqDto reqDto,
  );
}
