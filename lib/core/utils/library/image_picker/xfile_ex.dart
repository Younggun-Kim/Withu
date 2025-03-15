import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

extension XfileEx on XFile {
  DioMediaType getMime() {
    String extension = path.split('.').last.toLowerCase();
    String mimeType = _getMimeType(extension);

    return DioMediaType.parse(mimeType);
  }

  String _getMimeType(String extension) {
    switch (extension) {
      case 'png':
        return 'image/png';
      default:
        return 'image/jpg';
    }
  }
}
