part of 'global_bloc.dart';

typedef GlobalEmitter = Emitter<GlobalState>;

extension GlobalBlocHandler on GlobalBloc {
  void _onSignUpArgsStored(SignUpArgsStored event, GlobalEmitter emit) {}
  void _onSignUpArgsDeleted(SignUpArgsDeleted event, GlobalEmitter emit) {}
}
