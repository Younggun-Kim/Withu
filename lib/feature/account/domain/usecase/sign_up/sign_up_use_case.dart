import 'package:withu/feature/account/account.dart';

part 'sign_up_use_case_impl.dart';

abstract class SignUpUseCase {
  final AccountRepository repository;

  SignUpUseCase({required this.repository});
}
