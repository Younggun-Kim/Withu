import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/shared/dialogs/dialogs.dart';

part 'base_response_dto.freezed.dart';

part 'base_response_dto.g.dart';

part 'base_response_dto.mock.dart';

/// 서버 응답 기본 모델
@Freezed(genericArgumentFactories: true)
class BaseResponseDto<T> with _$BaseResponseDto<T> {
  factory BaseResponseDto({
    required bool success,
    @Default('') String message,
    T? data,
    @Default('') String errorCode,
  }) = _BaseResponseDto;

  factory BaseResponseDto.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$BaseResponseDtoFromJson(json, fromJsonT);
}

extension BaseResponseDtoEx on BaseResponseDto {
  void showErrorMessage() {
    if (!success && message.isNotEmpty) {
      Toast.showWithNavigatorKey(text: message);
    }
  }
}
