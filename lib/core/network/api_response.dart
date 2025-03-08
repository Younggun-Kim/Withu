import 'package:freezed_annotation/freezed_annotation.dart';

import 'dto/base/fail_response_dto.dart';

part 'api_response.freezed.dart';

@freezed
class ApiResponse<T> with _$ApiResponse<T> {
  const ApiResponse._();

  const factory ApiResponse.success(T data) = _Success<T>;

  const factory ApiResponse.fail(FailResponse failResponse) = _Fail;

  const factory ApiResponse.error() = _Error;
}

extension ApiResponseExt<T> on ApiResponse<T> {
  bool get isSuccess => maybeWhen(success: (_) => true, orElse: () => false);

  bool get isFail => maybeWhen(fail: (_) => true, orElse: () => false);

  bool get isError => maybeWhen(error: () => true, orElse: () => false);

  /// Success Data 가져오기
  T? get successData =>
      maybeWhen(success: (T data) => data, orElse: () => null);

  /// Fail Data 가져오기
  FailResponse? get failData => maybeWhen(
    fail: (FailResponse failResponse) => failResponse,
    orElse: () => null,
  );
}
