import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';
import 'package:withu/core/router/router.gr.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/common/domain/entity/phone/phone_value.dart';

import '../../find_id_result/find_id_result.dart';

part 'find_account_event.dart';

part 'find_account_state.dart';

part 'find_account_bloc.freezed.dart';

part 'find_account_bloc.handler.dart';

typedef FindAccountBlocProvider = BlocProvider<FindAccountBloc>;

typedef FindAccountBlocBuilder = BlocBuilder<FindAccountBloc, FindAccountState>;

typedef FindAccountBlocConsumer =
    BlocConsumer<FindAccountBloc, FindAccountState>;

typedef FindAccountBlocListener =
    BlocListener<FindAccountBloc, FindAccountState>;

class FindAccountBloc extends Bloc<FindAccountEvent, FindAccountState> {
  final FindAccountUseCase findAccountUseCase;

  FindAccountBloc({required this.findAccountUseCase})
    : super(FindAccountState(status: BaseBlocStatus.initial())) {
    on<FindAccountLoadingOn>(_onFindAccountLoadingOn);
    on<FindAccountLoadingOff>(_onFindAccountLoadingOff);
    on<FindAccountNameInputted>(_onFindAccountNameInputted);
    on<FindAccountPhoneNumInputted>(_onFindAccountPhoneNumInputted);
    on<FindAccountPhoneVerifyChanged>(_onFindAccountPhoneVerifyChanged);
    on<FindAccountEmailInputted>(_onFindAccountEmailInputted);
    on<FindAccountPageTypeChanged>(_onFindAccountPageTypeChanged);
    on<FindAccountFindIdPressed>(_onFindAccountFindIdPressed);
    on<FindAccountFindPasswordPressed>(_onFindAccountFindPasswordPressed);
  }
}
