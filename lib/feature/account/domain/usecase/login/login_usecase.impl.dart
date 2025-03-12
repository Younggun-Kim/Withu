part of 'login_usecase.dart';

class LoginUseCaseImpl implements LoginUseCase {
  LoginUseCaseImpl({required this.accountRepo});

  @override
  final AccountRepository accountRepo;

  /// 토큰 리프레시
  @override
  Future<bool> refresh() async {
    return await accountRepo.refreshToken();
  }

  /// 로그아웃
  @override
  Future<void> logout() async {
    await accountRepo.logout();
    getItAppRouter.replaceAll([LoginRoute()]);
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

  @override
  void storeEmailSignUpData() {
    accountRepo.storeEmailSignUpData();
  }
}
