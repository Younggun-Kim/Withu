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

  /// 이메일 로그인 요청
  @override
  Future<bool> requestEmailLogin({
    required EmailValue email,
    required PasswordValue password,
  }) async {
    final response = await accountRepo.emailLogin(
      dto: EmailLoginReqData(
        email: email.value,
        password: password.value,
        userType: 'AUTO',
      ),
    );

    if (!response.success) {
      Toast.showWithNavigatorKey(text: response.message);
      return false;
    }

    return loginProcess(
      signUpMethod: SignUpMethodType.email,
      tokens: response.data?.tokens,
    );
  }

  /// 애플 로그인 요청
  @override
  FutureOr<SnsLoginResValue> requestSnsLogin(String token) async {
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

extension LoginUseCaseEx on LoginUseCase {
  FutureOr<bool> loginProcess({
    required SignUpMethodType signUpMethod,
    required TokenListDto? tokens,
  }) async {
    if (tokens == null || tokens.hasToken == false) {
      accountRepo.resetStoredData();
      return false;
    }

    /// 1. 토큰 저장
    accountRepo.setToken(tokens);

    /// 2. 회원 정보 조회
    final userType = await getUserType();

    if (userType.isNone) {
      accountRepo.resetStoredData();
      return false;
    }

    /// 3. FCM 등록
    await accountRepo.postFcmTokenRegistration(userType: userType);

    /// 4. 홈으로 이동
    return true;
  }

  Future<UserType> getUserType() async {
    final myProfileDto = await accountRepo.getMyProfile();
    final myProfileData = myProfileDto.data;

    if (!myProfileDto.success || myProfileData == null) {
      Toast.showWithNavigatorKey(text: myProfileDto.message);
      return UserType.none;
    }

    return MyProfileEntityParser.fromDto(myProfileData).userType;
  }
}
