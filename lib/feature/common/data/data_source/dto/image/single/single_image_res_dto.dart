import 'package:withu/core/core.dart';

typedef SingleImageResDto = BaseResponseDto<String>;

extension SingleImageResDtoMock on SingleImageResDto {
  static SingleImageResDto empty() {
    return SingleImageResDto(success: true, message: '', data: '');
  }
}
