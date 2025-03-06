import 'dart:async';

import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:withu/feature/common/data/data_source/dto/validate_business/validate_business_req_dto.dart';
import 'package:withu/feature/common/data/data_source/dto/validate_business/validate_business_res_dto.dart';
import 'package:withu/feature/common/data/data_source/remote/api.dart';

class CommonMockApi extends CommonApiImpl {
  CommonMockApi({required super.network}) {
    dioAdapter = DioAdapter(dio: network.dio);
  }

  late final DioAdapter dioAdapter;

  /// 사업자등록 중복 검증
  @override
  FutureOr<ValidateBusinessResDto> postValidateBusiness(
    ValidateBusinessReqDto reqDto,
  ) async {
    /// Mock 응답 등록
    dioAdapter.onPost(
      paths[CommonApiPathType.validateBusiness] ?? '',
      (server) => server.reply(
        400,
        ValidateBusinessResDtoMock.duplicate().toJson((_) => null),
        delay: const Duration(seconds: 1),
      ),
      data: reqDto.toJson(),
    );

    return await super.postValidateBusiness(reqDto);
  }
}
