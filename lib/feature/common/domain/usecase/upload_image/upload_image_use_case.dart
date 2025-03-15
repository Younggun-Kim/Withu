import 'dart:async';

import 'package:image_picker/image_picker.dart';
import 'package:withu/feature/common/domain/repository/repository.dart';
import 'package:withu/shared/dialogs/dialogs.dart';

abstract class UploadImageUseCase {
  final CommonRepository commonRepo;

  UploadImageUseCase({required this.commonRepo});

  FutureOr<String> uploadProfile(XFile image);

  FutureOr<List<String>> uploadPortfolio(List<XFile> image);
}

class UploadImageUseCaseImpl implements UploadImageUseCase {
  @override
  final CommonRepository commonRepo;

  UploadImageUseCaseImpl({required this.commonRepo});

  @override
  FutureOr<String> uploadProfile(XFile image) async {
    final response = await commonRepo.uploadProfile(image);
    if (!response.success) {
      Toast.showWithNavigatorKey(text: response.message);
    }
    return response.data ?? '';
  }

  @override
  FutureOr<List<String>> uploadPortfolio(List<XFile> images) async {
    final response = await commonRepo.uploadPortfolio(images);
    if (!response.success) {
      Toast.showWithNavigatorKey(text: response.message);
    }
    return response.data ?? [];
  }
}
