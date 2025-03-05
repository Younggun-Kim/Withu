part of 'term_bloc.dart';

extension TermBlocHandler on TermBloc {
  /// 계정 타입 선택 이벤트.
  void _onTermAccountTypeSelected(
    TermAccountTypeSelected event,
    Emitter<TermState> emit,
  ) {
    emit(state.copyWith(accountType: event.value));
  }

  void _onTermFirstNextPressed(
    TermFirstNextPressed event,
    Emitter<TermState> emit,
  ) {
    emit(state.copyWith(step: TermPageStepType.second));
  }

  void _onTermSecondNextPressed(
    TermSecondNextPressed event,
    Emitter<TermState> emit,
  ) {
    // TODO
  }
}
