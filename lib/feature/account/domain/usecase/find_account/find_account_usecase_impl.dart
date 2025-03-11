part of 'find_account_usecase.dart';

class FindAccountUseCaseImpl implements FindAccountUseCase {
  @override
  final AccountRepository accountRepo;

  FindAccountUseCaseImpl({required this.accountRepo});

  @override
  FutureOr<FindIdResValue> findId(String phone) async {
    return await accountRepo.findId(phone);
  }

  @override
  FutureOr<bool> findPw({required LoginRequestEntity entity}) {
    // TODO: implement findPw
    throw UnimplementedError();
  }
}
