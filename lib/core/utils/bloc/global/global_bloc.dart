import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';

part 'global_event.dart';

part 'global_state.dart';

part 'global_bloc_handler.dart';

part 'global_bloc.freezed.dart';

class GlobalBloc extends BaseBloc<GlobalEvent, GlobalState> {
  final LoginUseCase loginUseCase;

  GlobalBloc({required this.loginUseCase})
    : super(GlobalState(status: BaseBlocStatus.initial())) {
    on<SignUpArgsStored>(_onSignUpArgsStored);
    on<SignUpArgsDeleted>(_onSignUpArgsDeleted);
  }
}
