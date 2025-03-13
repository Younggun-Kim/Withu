part of 'global_bloc.dart';

typedef GlobalEmitter = Emitter<GlobalState>;

extension GlobalBlocHandler on GlobalBloc {
  /// 회원가입에 전달할 Args 저장
  void _onGlobalSignUpArgsStored(
    GlobalSignUpArgsStored event,
    GlobalEmitter emit,
  ) {
    emit(state.copyWith(signUpArgs: event.args));
  }

  /// 회원가입에 전달한 Args 삭제
  void _onGlobalSignUpArgsDeleted(
    GlobalSignUpArgsDeleted event,
    GlobalEmitter emit,
  ) {
    emit(state.copyWith(signUpArgs: SignUpArgsValue()));
  }
}
