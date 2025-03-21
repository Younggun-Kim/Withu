import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/common/common.dart';
import 'package:withu/shared/dialogs/dialogs.dart';

part 'phone_auth_event.dart';

part 'phone_auth_state.dart';

part 'phone_auth_bloc.freezed.dart';

part 'phone_auth_bloc.handler.dart';

part 'verify_state_type.dart';

typedef PhoneAuthBlocProvider = BlocProvider<PhoneAuthBloc>;

typedef PhoneAuthBlocBuilder = BlocBuilder<PhoneAuthBloc, PhoneAuthState>;

typedef PhoneAuthBlocListener = BlocListener<PhoneAuthBloc, PhoneAuthState>;

class PhoneAuthBloc extends Bloc<PhoneAuthEvent, PhoneAuthState> {
  final PhoneAuthUseCase phoneAuthUseCase;

  PhoneAuthBloc({required this.phoneAuthUseCase})
    : super(PhoneAuthState(status: BaseBlocStatus.initial())) {
    on<PhoneAuthInitialized>(_onPhoneAuthInitialized);
    on<PhoneAuthPhoneInputted>(_onPhoneInputted);
    on<PhoneAuthAuthCodeSent>(_onAuthCodeRequested);
    on<PhoneAuthAuthCodeInputted>(_onAuthCodeInputted);
    on<PhoneAuthVerifyRequested>(_onPhoneAuthVerifyRequested);
  }
}
