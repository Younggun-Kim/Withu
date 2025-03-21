import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';
import 'package:withu/core/router/router.gr.dart';
import 'package:withu/feature/account/account.dart';

part 'login_event.dart';

part 'login_state.dart';

part 'login_bloc.freezed.dart';

part 'login_bloc.handler.dart';

part 'login_bloc_converter.dart';

typedef LoginBlocBuilder = BlocBuilder<LoginBloc, LoginState>;

class LoginBloc extends BaseBloc<LoginEvent, LoginState> {
  LoginBloc({required this.loginUseCase})
    : super(LoginState(status: BaseBlocStatus.initial())) {
    on<LoginMessageCleared>(_onMessageCleared);
    on<LoginIdInputted>(_onIdInputted);
    on<LoginPasswordInputted>(_onPasswordInputted);
    on<LoginVisiblePasswordToggled>(_onVisiblePasswordToggled);
    on<LoginAppleRequested>(_onLoginAppleRequested);
    on<LoginEmailSignUpPressed>(_onLoginEmailSignUpPressed);
  }
  final LoginUseCase loginUseCase;
}
