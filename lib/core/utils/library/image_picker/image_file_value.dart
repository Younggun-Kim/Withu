import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'image_file_value.freezed.dart';

@freezed
class ImageFileValue with _$ImageFileValue {
  const ImageFileValue._();

  const factory ImageFileValue({@Default('') String url, XFile? file}) =
      _ImageFileValue;
}

extension ImageFileEx on ImageFileValue {
  bool get hasUrl => url.isNotEmpty;

  bool get hasFile => file != null;

  XFile getFile() {
    return file ?? XFile('');
  }

  File toFile() {
    return File(file?.path ?? '');
  }
}

extension ImageFileValueListEx on List<ImageFileValue> {
  List<ImageFileValue> getOnlyHasFile() {
    return where((image) => image.hasFile).toList();
  }

  List<XFile> toFile() {
    return map((image) => image.file).whereType<XFile>().toList();
  }
}
