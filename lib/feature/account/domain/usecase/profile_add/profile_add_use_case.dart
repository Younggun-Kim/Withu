import 'package:withu/feature/account/account.dart';

abstract class ProfileAddUseCase {
  final AccountRepository accountRepo;

  ProfileAddUseCase({required this.accountRepo});
}

class ProfileAddUseCaseImpl implements ProfileAddUseCase {
  @override
  final AccountRepository accountRepo;

  ProfileAddUseCaseImpl({required this.accountRepo});
}
