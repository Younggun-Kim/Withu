import 'package:freezed_annotation/freezed_annotation.dart';

part 'fail_response_dto.freezed.dart';

part 'fail_response_dto.g.dart';

@freezed
abstract class FailResponse with _$FailResponse {
  const factory FailResponse({
    required int status,
    @Default('') String error,
    @Default('') String message,
    @Default('') String engMessage,
    required String path,
    required String timestamp,
  }) = _FailResponse;

  factory FailResponse.fromJson(Map<String, dynamic> json) =>
      _$FailResponseFromJson(json);

  /// 서버 에러 시.
  factory FailResponse.error() => const FailResponse(
    status: 500,
    message: '서버 에러',
    path: '',
    timestamp: '',
  );
}
