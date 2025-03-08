import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/common/domain/entity/phone/phone_value.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

part 'sign_up_bloc.freezed.dart';

part 'sign_up_bloc.handler.dart';

typedef SignUpBlocProvider = BlocProvider<SignUpBloc>;

typedef SignUpBlocBuilder = BlocBuilder<SignUpBloc, SignUpState>;

typedef SignUpBlocListener = BlocListener<SignUpBloc, SignUpState>;

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase signUpUseCase;

  SignUpBloc({required this.signUpUseCase})
    : super(SignUpState(status: BaseBlocStatus.initial())) {
    on<SignUpRequestSent>(_onSignUpRequestSent);
    on<SignUpRequestCompleted>(_onSignUpRequestCompleted);
    on<SignUpBirthDateInputted>(_onSignUpBirthDateInputted);
    on<SignUpGenderSelected>(_onSignUpGenderSelected);
    on<SignUpEmailInputted>(_onSignUpEmailInputted);
    on<SignUpPasswordInputted>(_onSignUpPasswordInputted);
    on<SignUpChannelSelected>(_onSignUpChannelSelected);
    on<SignUpReferrerUserInputted>(_onSignUpReferrerUserInputted);
  }
}
