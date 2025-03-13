part of 'sign_up_bloc.dart';

@freezed
class SignUpState extends BaseBlocState with _$SignUpState {
  factory SignUpState({
    required BaseBlocStatus status,

    @Default('') String message,

    @Default(null) SignUpPageArgs? args,

    /// 이름
    @Default(NameValue()) NameValue name,

    /// 생년월일
    @Default(BirthDateValue()) BirthDateValue birthDate,

    /// 휴대폰
    @Default(PhoneValue()) PhoneValue phone,

    /// 휴대폰 인증 여부
    @Default(false) bool isPhoneVerify,

    /// 성별
    @Default(GenderType.none) GenderType gender,

    /// 이메일
    @Default(EmailValue()) EmailValue email,

    /// 비밀번호
    @Default(PasswordValue()) PasswordValue password,

    /// 채널
    @Default(ChannelType.none) ChannelType channel,

    /// 추천인
    @Default('') String referrerUser,
  }) = _SignUpState;
}

extension SignUpStateEx on SignUpState {
  bool get isSnsSignUp => args?.signUpType.isSns == true;

  String get channelText {
    if (channel.isNone) {
      return '저희 앱을 어떻게 찾아주셨나요?';
    }
    return channel.toString();
  }

  /// 버튼 Enabled 여부
  bool get isEnabledSubmitBtn {
    return name.isValid() &&
        birthDate.isValid() &&
        !gender.isNone &&
        phone.isValid() &&
        isPhoneVerify &&
        email.isValid() &&
        password.isValid();
  }

  CompanySignUpEntity toEntity() {
    return CompanySignUpEntity(
      accountType: args?.accountType ?? UserType.none,
      name: name.value,
      birthDate: birthDate.formattedDate,
      gender: gender,
      phoneNo: phone.formatPhoneNumber(),
      email: email.value,
      password: password.value,
      signUpMethod: SignUpMethodType.email,
      businessNumber: args?.businessNum ?? '',
      companyName: args?.companyName ?? '',
      appAcquisitionChannel: channel,
      locationInfoConsent: args?.isAgreeLocation ?? false,
      marketingInfoConsent: args?.isAgreeMarketing ?? false,
    );
  }

  SnsSignUpReqValue toSnsData() {
    return SnsSignUpReqValue(
      tempToken: args?.tempToken ?? '',
      name: name.value,
      birthDate: birthDate.formattedDate,
      gender: gender,
      phoneNo: phone.formatPhoneNumber(),
      businessNumber: args?.businessNum ?? '',
      companyName: args?.companyName ?? '',
      appAcquisitionChannel: channel,
      locationInfoConsent: args?.isAgreeLocation ?? false,
      marketingInfoConsent: args?.isAgreeMarketing ?? false,
    );
  }
}
