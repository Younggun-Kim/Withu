part of 'sign_up_bloc.dart';

@freezed
class SignUpState extends BaseBlocState with _$SignUpState {
  factory SignUpState({
    required BaseBlocStatus status,

    @Default('') String message,

    /// 생년월일
    @Default(BirthDateValue()) BirthDateValue birthDate,

    /// 휴대폰
    @Default(PhoneValue()) PhoneValue phone,

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
  String get channelText {
    if (channel.isNone) {
      return '저희 앱을 어떻게 찾아주셨나요?';
    }
    return channel.toString();
  }
}
