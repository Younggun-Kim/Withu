import 'dart:async';

import 'package:image_picker/image_picker.dart';


class ImagePickerUtils {
  final _picker = ImagePicker();

  // 카메라에서 사진 가져오기
  FutureOr<XFile?> getPhotoFromCamera() async {
    return await _picker.pickImage(source: ImageSource.camera);
  }

  // 앨범에서 사진 가져오기
  FutureOr<XFile?> getPhotoFromAlbum() async {
    return await _picker.pickImage(source: ImageSource.gallery);
  }
}
