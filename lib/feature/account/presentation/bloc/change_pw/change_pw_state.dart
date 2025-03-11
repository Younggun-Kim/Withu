part of 'change_pw_bloc.dart';

@freezed
class ChangePwState extends BaseBlocState with _$ChangePwState {
  factory ChangePwState({
    required BaseBlocStatus status,

    @Default(PasswordValue()) PasswordValue password,

    @Default(ChangePwPageArgs.empty) ChangePwPageArgs args,
  }) = _ChangePwState;
}

extension ChangePwStateEx on ChangePwState {
  bool get isEnabledFindPw => password.isValid();

  ChangePwValue toChangePwValue() {
    return ChangePwValue(
      name: args.name,
      email: args.email,
      phone: args.phone,
      password: password,
    );
  }
}
