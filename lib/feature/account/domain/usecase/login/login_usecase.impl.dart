part of 'login_usecase.dart';

class LoginUseCaseImpl implements LoginUseCase {
  LoginUseCaseImpl({required this.accountRepo});

  @override
  final AccountRepository accountRepo;

  /// 로그인
  @override
  Future<LoginResultEntity> login({required LoginRequestEntity entity}) async {
    final result = await accountRepo.login(requestData: entity.toDto());

    storeToken(token: result.successData?.sessionId ?? '');

    return LoginResultEntityConverter.fromDto(result: result);
  }

  /// 세션 Id 저장
  void storeToken({required String token}) {
    if (token.isNotEmpty) {
      accountRepo.storeToken(token: token);
    }
  }

  /// 로그인 여부
  @override
  Future<bool> checkLogin() async {
    final sessionId = await accountRepo.getToken();
    return sessionId.isNotEmpty;
  }

  /// 애플 로그인 요청
  @override
  FutureOr<SnsLoginResValue> requestAppleLogin(String token) async {
    return await accountRepo.requestAppleLogin(
      AppleLoginReqDto(idToken: token, firstName: '', lastName: ''),
    );
  }

  @override
  void storeSnsSignUpData(LoginType type, String tempToken) {
    accountRepo.storeSnsSignUpData(type, tempToken);
  }
}
