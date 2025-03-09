part of 'term_bloc.dart';

@freezed
class TermState extends BaseBlocState with _$TermState {
  factory TermState({
    /// 상태.
    required BaseBlocStatus status,

    /// 다이얼로그 메시지
    @Default('') String message,

    @Default(TermPageArgs(type: LoginType.email)) TermPageArgs args,

    @Default(TermPageStepType.first) TermPageStepType step,

    @Default(AccountType.none) AccountType accountType,

    @Default(false) bool serviceTerm,

    @Default(false) bool privacyTerm,

    @Default(false) bool financeTerm,

    @Default(false) bool locationTerm,

    @Default(false) bool marketingTerm,
  }) = _TermState;
}

extension TermStateEx on TermState {
  bool get isEnabledFirstStep => step.isFirst && !accountType.isNone;

  bool get isEnabledSecondStep => !step.isFirst && isRequiredChecked;

  bool get isAllChecked {
    return serviceTerm &&
        privacyTerm &&
        financeTerm &&
        locationTerm &&
        marketingTerm;
  }

  bool get isRequiredChecked {
    return serviceTerm && privacyTerm;
  }
}
