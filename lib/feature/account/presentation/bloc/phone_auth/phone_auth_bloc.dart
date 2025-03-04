import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';

part 'phone_auth_event.dart';

part 'phone_auth_state.dart';

part 'phone_auth_bloc.freezed.dart';

part 'phone_auth_bloc.handler.dart';

part 'phone_auth_bloc.parser.dart';

class PhoneAuthBloc
    extends Bloc<PhoneAuthEvent, PhoneAuthState> {
  final PhoneAuthUseCase phoneAuthUseCase;

  PhoneAuthBloc({
    required this.phoneAuthUseCase,
  }) : super(
          PhoneAuthState(status: BaseBlocStatus.initial()),
        ) {
    on<PhoneAuthPhoneInputted>(_onPhoneInputted);
    on<PhoneAuthAuthCodeSent>(_onAuthCodeRequested);
    on<PhoneAuthAuthCodeInputted>(_onAuthCodeInputted);
  }
}
