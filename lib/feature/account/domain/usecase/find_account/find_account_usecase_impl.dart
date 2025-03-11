part of 'find_account_usecase.dart';

class FindAccountUseCaseImpl implements FindAccountUseCase {
  @override
  final AccountRepository accountRepo;

  FindAccountUseCaseImpl({required this.accountRepo});

  @override
  FutureOr<bool> findId({required LoginRequestEntity entity}) {
    // TODO: implement findId
    throw UnimplementedError();
  }

  @override
  FutureOr<bool> findPw({required LoginRequestEntity entity}) {
    // TODO: implement findPw
    throw UnimplementedError();
  }
}
