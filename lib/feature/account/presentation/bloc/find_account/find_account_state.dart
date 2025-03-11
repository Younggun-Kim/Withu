part of 'find_account_bloc.dart';

enum FindAccountPageType {
  id,
  password;

  bool get isId => this == id;

  bool get isPw => this == password;
}

@freezed
class FindAccountState extends BaseBlocState with _$FindAccountState {
  factory FindAccountState({
    required BaseBlocStatus status,

    @Default(NameValue()) NameValue name,

    @Default(PhoneValue()) PhoneValue phone,

    @Default(false) bool isPhoneVerify,

    @Default(EmailValue()) EmailValue email,

    @Default(FindAccountPageType.id) FindAccountPageType pageType,
  }) = _FindAccountState;
}

extension FindAccountStateEx on FindAccountState {
  bool get isEnabledFindId => name.isValid() && isPhoneVerify;
}
