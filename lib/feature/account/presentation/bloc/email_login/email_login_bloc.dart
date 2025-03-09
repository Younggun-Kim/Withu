import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';

part 'email_login_bloc.handler.dart';

part 'email_login_event.dart';

part 'email_login_state.dart';

part 'email_login_bloc.freezed.dart';

typedef EmailLoginBlocProvider = BlocProvider<EmailLoginBloc>;

typedef EmailLoginBlocConsumer = BlocConsumer<EmailLoginBloc, EmailLoginState>;

typedef EmailLoginBlocBuilder = BlocBuilder<EmailLoginBloc, EmailLoginState>;

class EmailLoginBloc extends BaseBloc<EmailLoginEvent, EmailLoginState> {
  final EmailLoginUseCase emailLoginUseCase;

  EmailLoginBloc({required this.emailLoginUseCase})
    : super(EmailLoginState(status: BaseBlocStatus.initial())) {
    on<EmailLoginEmailInputted>(_onEmailLoginEmailInputted);
    on<EmailLoginPasswordInputted>(_onEmailLoginPasswordInputted);
    on<EmailLoginSubmitted>(_onEmailLoginSubmitted);
  }
}
