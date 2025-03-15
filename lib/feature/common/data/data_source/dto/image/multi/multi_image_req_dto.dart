import 'dart:async';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:withu/core/utils/library/image_picker/xfile_ex.dart';

import '../server_image_type.dart';

part 'multi_image_req_dto.freezed.dart';

/// 지역 응답 모델
@freezed
class MultiImageReqDto with _$MultiImageReqDto {
  factory MultiImageReqDto({
    required List<XFile> images,
    required ServerImageType type,
  }) = _MultiImageReqDto;
}

extension MultiImageReqDtoEx on MultiImageReqDto {
  FutureOr<List<MultipartFile>> getMultipartFiles() async {
    return await Future.wait(
      images.map(
        (file) async => await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
          contentType: file.getMime(),
        ),
      ),
    );
  }

  FutureOr<FormData> toFormData() async {
    return FormData.fromMap({
      'images': await getMultipartFiles(),
      'type': type.serverKey,
    });
  }
}
