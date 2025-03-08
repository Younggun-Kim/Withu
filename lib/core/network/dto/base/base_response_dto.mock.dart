part of 'base_response_dto.dart';

extension BaseResponseDtoMock<T> on BaseResponseDto<T> {
  static BaseResponseDto<S> success<S>(S data) {
    return BaseResponseDto<S>(
      success: true,
      message: '',
      data: data,
      error: null,
    );
  }

  static BaseResponseDto failure<S>(FailResponse error) {
    return BaseResponseDto<S>(
      success: false,
      message: '',
      data: null,
      error: error,
    );
  }

  static BaseResponseDto error() {
    return BaseResponseDto(
      success: false,
      message: '',
      data: null,
      error: FailResponse.error(),
    );
  }
}
