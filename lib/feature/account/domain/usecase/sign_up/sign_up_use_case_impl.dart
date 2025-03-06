part of 'sign_up_use_case.dart';

class SignUpUseCaseImpl implements SignUpUseCase {
  @override
  final AccountRepository repository;

  SignUpUseCaseImpl({required this.repository});
}
