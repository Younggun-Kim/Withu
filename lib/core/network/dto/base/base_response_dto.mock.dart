part of 'base_response_dto.dart';

extension BaseResponseDtoMock<T> on BaseResponseDto<T> {
  static BaseResponseDto<S> success<S>(S data) {
    return BaseResponseDto<S>(success: true, message: '', data: data);
  }

  static BaseResponseDto failure<S>(String message) {
    return BaseResponseDto<S>(
      success: false,
      message: message,
      data: null,
      errorCode: 'SERVER_ERROR',
    );
  }

  static BaseResponseDto error() {
    return BaseResponseDto(
      success: false,
      message: '서버에러',
      data: null,
      errorCode: 'SERVER_ERROR',
    );
  }
}
