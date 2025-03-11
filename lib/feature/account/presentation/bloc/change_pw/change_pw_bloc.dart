import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/account/domain/entity/change_pw/change_pw_value.dart';
import 'package:withu/feature/account/presentation/change_pw/change_pw_page_args.dart';

part 'change_pw_event.dart';

part 'change_pw_state.dart';

part 'change_pw_bloc.freezed.dart';

part 'change_pw_bloc.handler.dart';

typedef ChangePwBlocProvider = BlocProvider<ChangePwBloc>;

typedef ChangePwBlocBuilder = BlocBuilder<ChangePwBloc, ChangePwState>;

typedef ChangePwBlocConsumer = BlocConsumer<ChangePwBloc, ChangePwState>;

typedef ChangePwBlocListener = BlocListener<ChangePwBloc, ChangePwState>;

class ChangePwBloc extends Bloc<ChangePwEvent, ChangePwState> {
  final ChangePwUseCase changePwUseCase;

  ChangePwBloc({required this.changePwUseCase})
    : super(ChangePwState(status: BaseBlocStatus.initial())) {
    on<ChangePwArgsStored>(_onChangePwArgsStored);
    on<ChangePwInputted>(_onChangePwInputted);
    on<ChangePwRequested>(_onChangePwRequested);
  }
}
