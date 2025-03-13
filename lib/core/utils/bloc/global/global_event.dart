part of 'global_bloc.dart';

sealed class GlobalEvent extends BaseBlocEvent {}

class GlobalSignUpArgsStored extends GlobalEvent {
  final SignUpArgsValue args;

  GlobalSignUpArgsStored({required this.args});
}

class GlobalSignUpArgsDeleted extends GlobalEvent {}
