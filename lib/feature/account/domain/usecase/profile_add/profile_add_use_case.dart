import 'dart:async';

import 'package:withu/feature/account/account.dart';
import 'package:withu/shared/dialogs/toast/toast.dart';

/// 프로필 등록/수정 UseCase
abstract class ProfileAddUseCase {
  final AccountRepository accountRepo;

  ProfileAddUseCase({required this.accountRepo});

  // TODO: 반환 값 수정
  FutureOr<bool> exec({
    required bool isCompany,
    required ProfileUpdateValue data,
  });
}

class ProfileAddUseCaseImpl implements ProfileAddUseCase {
  @override
  final AccountRepository accountRepo;

  ProfileAddUseCaseImpl({required this.accountRepo});

  @override
  FutureOr<bool> exec({
    required bool isCompany,
    required ProfileUpdateValue data,
  }) async {
    final response = await accountRepo.postProfileUpdate(
      isCompany: isCompany,
      dto: data.toDto(),
    );

    if (!response.success) {
      Toast.showWithNavigatorKey(text: response.message);
      return false;
    }

    /// TODO:  프로필 정보 저장하는 코드가 필요할 듯
    return response.success;
  }
}
