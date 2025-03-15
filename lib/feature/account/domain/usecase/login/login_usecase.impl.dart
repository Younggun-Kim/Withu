part of 'login_usecase.dart';

class LoginUseCaseImpl implements LoginUseCase {
  LoginUseCaseImpl({required this.accountRepo});

  @override
  final AccountRepository accountRepo;

  /// 토큰 리프레시
  @override
  Future<bool> refresh() async {
    final response = await accountRepo.refreshToken();
    final tokens = response.toTokens();

    if (!tokens.hasToken) {
      accountRepo.resetStoredData();
      return false;
    }

    return loginProcess(tokens: tokens);
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

    return loginProcess(tokens: response.tokens);
  }

  /// 애플 로그인 요청
  @override
  FutureOr<SnsLoginResValue> requestSnsLogin(String token) async {
    final response = await accountRepo.requestAppleLogin(
      AppleLoginReqDto(idToken: token, firstName: '', lastName: ''),
    );
    final tokens = response.data?.tokenPair;
    bool isLoggedIn = false;
    if (tokens != null && tokens.hasToken) {
      isLoggedIn = await loginProcess(tokens: tokens);
    }

    return SnsLoginResValue(
      isLoggedIn: isLoggedIn,
      tempToken: response.data?.tempToken ?? '',
    );
  }

  /// FCM 등록
  @override
  Future<FcmRegistrationResDto> registerFcmToken(UserType userType) async {
    return await accountRepo.postFcmTokenRegistration(userType: userType);
  }
}

extension LoginUseCaseEx on LoginUseCase {
  FutureOr<bool> loginProcess({required TokenListDto? tokens}) async {
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
    await registerFcmToken(userType);

    /// 4. 홈으로 이동
    return true;
  }

  Future<UserType> getUserType() async {
    final myProfileDto = await accountRepo.getUserInfo();
    final myProfileData = myProfileDto.data;

    if (!myProfileDto.success || myProfileData == null) {
      Toast.showWithNavigatorKey(text: myProfileDto.message);
      return UserType.none;
    }

    return MyProfileEntityParser.fromDto(myProfileData).userType;
  }
}
