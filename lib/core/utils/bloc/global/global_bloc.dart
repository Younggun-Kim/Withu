import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';

part 'global_event.dart';

part 'global_state.dart';

part 'global_bloc_handler.dart';

part 'global_bloc.freezed.dart';

typedef GlobalBlocProvider = BlocProvider<GlobalBloc>;

typedef GlobalBlocConsumer = BlocConsumer<GlobalBloc, GlobalState>;

typedef GlobalBlocListener = BlocListener<GlobalBloc, GlobalState>;

typedef GlobalBlocBuilder = BlocBuilder<GlobalBloc, GlobalState>;

class GlobalBloc extends BaseBloc<GlobalEvent, GlobalState> {
  GlobalBloc() : super(GlobalState(status: BaseBlocStatus.initial())) {
    on<GlobalSignUpArgsStored>(_onGlobalSignUpArgsStored);
    on<GlobalUserInfoStored>(_onGlobalUserInfoStored);
  }
}
