import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/domain/type/sign_up_method_type.dart';

part 'find_id_res_dto.freezed.dart';

part 'find_id_res_dto.g.dart';

typedef FindIdResDto = BaseResponseDto<FindIdResData>;

@freezed
class FindIdResData with _$FindIdResData {
  factory FindIdResData({
    required bool success,
    required String message,
    required String email,
    required SignUpMethodType signUpMethod,
  }) = _FindIdResData;

  factory FindIdResData.fromJson(Map<String, dynamic> json) =>
      _$FindIdResDataFromJson(json);
}

extension FindIdResDtoMock on FindIdResDto {
  static FindIdResDto successEmail() {
    return FindIdResDto(
      success: true,
      message: '계정 찾기 성공',
      data: FindIdResData(
        success: true,
        message: '계정 찾기 성공',
        email: "test@test.com",
        signUpMethod: SignUpMethodType.email,
      ),
      errorCode: '',
    );
  }

  static FindIdResDto successApple() {
    return FindIdResDto(
      success: true,
      message: '계정 찾기 성공',
      data: FindIdResData(
        success: true,
        message: '계정 찾기 성공',
        email: "test@test.com",
        signUpMethod: SignUpMethodType.apple,
      ),
      errorCode: '',
    );
  }
}
