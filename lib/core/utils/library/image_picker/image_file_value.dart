import 'dart:io';

import 'package:image_picker/image_picker.dart';

typedef ImageFileValue = XFile;

extension ImageFileEx on ImageFileValue {
  File toFile() {
    return File(path);
  }
}
