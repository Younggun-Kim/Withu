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
  }) = _SignUpState;
}
