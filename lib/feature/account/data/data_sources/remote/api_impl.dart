import 'dart:async';
import 'package:withu/core/core.dart';
import 'package:withu/core/network/dto/base/fail_response_dto.dart';
import 'package:withu/feature/account/data/data_sources/dto/dto.dart';
import 'api.dart';

class AccountApiImpl extends AccountApi {
  AccountApiImpl({required this.network});
  final DioNetwork network;

  /// 로그인 API
  @override
  FutureOr<ApiResponse<LoginResponseDto>> login({
    required LoginRequestDto requestData,
  }) async {
    return network.dio
        .post(loginPath, data: requestData.toJson())
        .then(
          (response) =>
              ApiResponse.success(LoginResponseDto.fromJson(response.data)),
        )
        .catchError(
          (_) => ApiResponse<LoginResponseDto>.fail(FailResponse.error()),
        );
  }
}
