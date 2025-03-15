import 'dart:async';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../server_image_type.dart';

part 'single_image_req_dto.freezed.dart';

/// 단일 이미지 업로드 요청 모델
@freezed
class SingleImageReqDto with _$SingleImageReqDto {
  factory SingleImageReqDto({
    required XFile image,
    required ServerImageType type,
  }) = _SingleImageReqDto;
}

extension SingleImageReqDtoEx on SingleImageReqDto {
  FutureOr<FormData> toFormData() async {
    return FormData.fromMap({
      'image': await MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
      ),
      'type': type.serverKey,
    });
  }
}
