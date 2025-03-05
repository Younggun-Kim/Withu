part of 'term_bloc.dart';

@freezed
class TermState extends BaseBlocState with _$TermState {
  factory TermState({
    /// 상태.
    required BaseBlocStatus status,

    /// 다이얼로그 메시지
    @Default('') String message,

    @Default(TermPageStepType.first) TermPageStepType step,

    @Default(AccountType.none) AccountType accountType,
  }) = _TermState;
}

extension TermStateEx on TermState {
  bool get isEnabledFirstStep => step.isFirst && !accountType.isNone;
}
