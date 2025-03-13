part of 'validate_business_bloc.dart';

typedef ValidateBusinessEmitter = Emitter<ValidateBusinessState>;

extension ValidateBusinessBlocHandler on ValidateBusinessBloc {
  void _onValidateBusinessArgsStored(
    ValidateBusinessArgsStored event,
    ValidateBusinessEmitter emit,
  ) {
    emit(state.copyWith(args: event.value));
  }

  void _onValidateBusinessNumInputted(
    ValidateBusinessNumInputted event,
    ValidateBusinessEmitter emit,
  ) {
    emit(state.copyWith(businessNum: event.value));
  }

  void _onValidateBusinessCeoNameInputted(
    ValidateBusinessCeoNameInputted event,
    ValidateBusinessEmitter emit,
  ) {
    emit(state.copyWith(ceoName: event.value));
  }

  void _onValidateBusinessCompanyNameInputted(
    ValidateBusinessCompanyNameInputted event,
    ValidateBusinessEmitter emit,
  ) {
    emit(state.copyWith(companyName: event.value));
  }

  void _onValidateBusinessOpenDateNameInputted(
    ValidateBusinessOpenDateNameInputted event,
    ValidateBusinessEmitter emit,
  ) {
    emit(state.copyWith(openDate: event.value));
  }

  void _onValidateBusinessCheckDuplicationPressed(
    ValidateBusinessCheckDuplicationPressed event,
    ValidateBusinessEmitter emit,
  ) async {
    emit(state.copyWith(status: BaseBlocStatus.loading()));

    final canRegistration = await useCase.checkDuplication(state.toEntity());

    emit(
      state.copyWith(
        status: getResultStatus(canRegistration),
        iSDuplicated: VisibleTypeEx.fromBool(!canRegistration),
      ),
    );

    moveSignUpPage();
  }

  BaseBlocStatus getResultStatus(bool result) {
    return result ? BaseBlocStatus.success() : BaseBlocStatus.failure();
  }

  void moveSignUpPage() async {
    if (!state.status.isSuccess) {
      return;
    }

    // TODO
    final signUpType = SignUpMethodType.email;
    final tempToken = '';
    getItAppRouter.push(
      SignUpRoute(
        args: SignUpPageArgs.company(
          businessNum: state.businessNum.value,
          ceoName: state.ceoName.value,
          companyName: state.companyName.value,
          isAgreeLocation: state.args?.isAgreeLocation ?? false,
          isAgreeMarketing: state.args?.isAgreeMarketing ?? false,
          signUpType: signUpType,
          tempToken: tempToken,
        ),
      ),
    );
  }
}
