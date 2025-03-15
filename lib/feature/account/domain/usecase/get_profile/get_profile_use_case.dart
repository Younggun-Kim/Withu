import 'dart:async';

import 'package:withu/feature/account/account.dart';
import 'package:withu/shared/dialogs/toast/toast.dart';

/// 프로필 정보 조회
abstract class GetProfileUseCase {
  final AccountRepository accountRepo;

  GetProfileUseCase({required this.accountRepo});

  FutureOr<ProfileDetailEntity> exec(bool isCompany);
}

class GetProfileUseCaseImpl implements GetProfileUseCase {
  @override
  final AccountRepository accountRepo;

  GetProfileUseCaseImpl({required this.accountRepo});

  @override
  FutureOr<ProfileDetailEntity> exec(bool isCompany) async {
    final response = await accountRepo.getProfile(isCompany);
    final data = response.data;
    if (data == null || !response.success) {
      Toast.showWithNavigatorKey(text: response.message);
      return ProfileDetailEntityParser.empty();
    }

    return ProfileDetailEntityParser.fromDto(data);
  }
}
