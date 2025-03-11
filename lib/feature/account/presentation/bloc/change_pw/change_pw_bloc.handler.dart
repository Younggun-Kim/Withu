part of 'change_pw_bloc.dart';

extension ChangePwBlocHandler on ChangePwBloc {
  void _onChangePwArgsStored(
    ChangePwArgsStored event,
    Emitter<ChangePwState> emit,
  ) {
    emit(state.copyWith(args: event.args));
  }

  void _onChangePwInputted(
    ChangePwInputted event,
    Emitter<ChangePwState> emit,
  ) {
    emit(state.copyWith(password: event.password));
  }

  void _onChangePwRequested(
    ChangePwRequested event,
    Emitter<ChangePwState> emit,
  ) async {
    emit(state.copyWith(status: BaseBlocStatus.loading()));

    final isChanged = await changePwUseCase.changePw(state.toChangePwValue());

    emit(state.copyWith(status: BaseBlocStatus.fromSuccess(isChanged)));
    moveNextPageFrom(isChanged);
  }

  void moveNextPageFrom(bool isChanged) {
    if (isChanged) {
      getItAppRouter.popUntilRoot();
    }
  }
}
