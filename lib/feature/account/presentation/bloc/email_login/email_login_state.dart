part of 'email_login_bloc.dart';

@freezed
class EmailLoginState extends BaseBlocState with _$EmailLoginState {
  factory EmailLoginState({
    /// 상태.
    required BaseBlocStatus status,

    @Default(EmailValue()) EmailValue email,

    @Default(PasswordValue()) PasswordValue password,
  }) = _EmailLoginState;
}

extension EmailLoginStateEx on EmailLoginState {
  bool get isEnabledSubmit => email.isValid() && password.isValid();
}
