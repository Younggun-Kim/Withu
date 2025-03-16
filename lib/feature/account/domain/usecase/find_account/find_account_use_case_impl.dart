part of 'find_account_use_case.dart';

class FindAccountUseCaseImpl implements FindAccountUseCase {
  @override
  final AccountRepository accountRepo;

  FindAccountUseCaseImpl({required this.accountRepo});

  @override
  FutureOr<FindIdResValue> findId(String phone) async {
    final response = await accountRepo.findId(phone);

    if (!response.success) {
      Toast.showWithNavigatorKey(text: response.message);
    }

    return FindIdResValueParser.fromDto(response.data);
  }
}
