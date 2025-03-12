import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';

part 'refresh_res_dto.freezed.dart';

part 'refresh_res_dto.g.dart';

typedef RefreshResDto = BaseResponseDto<RefreshResData>;

@freezed
class RefreshResData with _$RefreshResData {
  factory RefreshResData({
    @Default('') String accessToken,
    @Default('') String refreshToken,
    @Default('') String tokenType,
    @Default(0) int expiresIn,
    AccountType? accountType,
  }) = _RefreshResData;

  factory RefreshResData.fromJson(Map<String, dynamic> json) =>
      _$RefreshResDataFromJson(json);
}

extension RefreshResDtoEx on RefreshResDto {
  bool get hasTokens =>
      data?.accessToken.isNotEmpty == true &&
      data?.refreshToken.isNotEmpty == true;
}

extension RefreshResDtoMock on RefreshResDto {
  static RefreshResDto success() {
    return RefreshResDto(
      success: true,
      message: '토큰이 갱신되었습니다.',
      data: RefreshResData(
        accessToken: 'refreshed-access-token',
        refreshToken: 'refreshed-refresh-token',
        expiresIn: 3600,
        tokenType: 'Bearer',
      ),
      errorCode: '',
    );
  }

  static RefreshResDto error() {
    return RefreshResDto(
      success: false,
      message: '서버 에러',
      data: null,
      errorCode: 'SERVER_ERROR',
    );
  }
}
