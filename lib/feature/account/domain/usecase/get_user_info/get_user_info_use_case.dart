import 'dart:async';

import 'package:withu/feature/account/account.dart';
import 'package:withu/shared/dialogs/toast/toast.dart';

/// 회원 정보 조회
abstract class GetUserInfoUseCase {
  final AccountRepository repo;

  GetUserInfoUseCase({required this.repo});

  FutureOr<MyProfileEntity> exec();
}

class GetUserProfileUseCaseImpl implements GetUserInfoUseCase {
  @override
  final AccountRepository repo;

  GetUserProfileUseCaseImpl({required this.repo});

  @override
  FutureOr<MyProfileEntity> exec() async {
    final response = await repo.getUserInfo();
    final data = response.data;
    if (data == null || !response.success) {
      Toast.showWithNavigatorKey(text: response.message);
      return MyProfileEntityParser.error();
    }

    return MyProfileEntityParser.fromDto(data);
  }
}
