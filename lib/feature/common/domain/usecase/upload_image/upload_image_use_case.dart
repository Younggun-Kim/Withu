import 'dart:async';

import 'package:image_picker/image_picker.dart';
import 'package:withu/feature/common/domain/repository/repository.dart';
import 'package:withu/shared/dialogs/dialogs.dart';

abstract class UploadImageUseCase {
  final CommonRepository commonRepo;

  UploadImageUseCase({required this.commonRepo});

  FutureOr<String> uploadSingle(XFile image);
}

class UploadImageUseCaseImpl implements UploadImageUseCase {
  @override
  final CommonRepository commonRepo;

  UploadImageUseCaseImpl({required this.commonRepo});

  @override
  FutureOr<String> uploadSingle(XFile image) async {
    final response = await commonRepo.uploadPProfile(image);
    if (!response.success) {
      Toast.showWithNavigatorKey(text: response.message);
    }
    return response.data ?? '';
  }
}
