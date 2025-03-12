import 'package:withu/feature/account/account.dart';

abstract class ProfileRegistrationUseCase {
  final AccountRepository accountRepo;

  ProfileRegistrationUseCase({required this.accountRepo});
}

class ProfileRegistrationUseCaseImpl implements ProfileRegistrationUseCase {
  @override
  final AccountRepository accountRepo;

  ProfileRegistrationUseCaseImpl({required this.accountRepo});
}
