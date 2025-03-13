part of 'global_bloc.dart';

sealed class GlobalEvent extends BaseBlocEvent {}

class SignUpArgsStored extends GlobalEvent {}

class SignUpArgsDeleted extends GlobalEvent {}
