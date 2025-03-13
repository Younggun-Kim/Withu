import 'dart:async';

import 'package:image_picker/image_picker.dart';

import 'image_file_value.dart';

class ImagePickerUtils {
  final _picker = ImagePicker();

  // 카메라에서 사진 가져오기
  FutureOr<ImageFileValue?> getPhotoFromCamera() async {
    return await _picker.pickImage(source: ImageSource.camera);
  }

  // 앨범에서 사진 가져오기
  FutureOr<ImageFileValue?> getPhotoFromAlbum() async {
    return await _picker.pickImage(source: ImageSource.gallery);
  }
}
