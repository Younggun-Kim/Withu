import 'dart:async';

import 'package:withu/feature/account/account.dart';
import 'package:withu/shared/dialogs/toast/toast.dart';

/// 회원 정보 조회
abstract class GetUserProfileUseCase {
  final AccountRepository repo;

  GetUserProfileUseCase({required this.repo});

  FutureOr<MyProfileEntity> exec();
}

class GetUserProfileUseCaseImpl implements GetUserProfileUseCase {
  @override
  final AccountRepository repo;

  GetUserProfileUseCaseImpl({required this.repo});

  @override
  FutureOr<MyProfileEntity> exec() async {
    final response = await repo.getMyProfile();
    final data = response.data;
    if (data == null || !response.success) {
      Toast.showWithNavigatorKey(text: response.message);
      return MyProfileEntityParser.error();
    }

    return MyProfileEntityParser.fromDto(data);
  }
}
