import 'package:withu/core/network/dto/base/base_response_dto.dart';

typedef MultiImageResDto = BaseResponseDto<List<String>>;

extension MultiImageResDtoMock on MultiImageResDto {
  static MultiImageResDto empty() {
    return MultiImageResDto(success: true, message: '', data: []);
  }
}
