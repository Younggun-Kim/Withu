part of 'validate_business_bloc.dart';

typedef ValidateBusinessEmitter = Emitter<ValidateBusinessState>;

extension ValidateBusinessBlocHandler on ValidateBusinessBloc {
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

    final isRegistered = await useCase.checkDuplication(state.toEntity());

    emit(
      state.copyWith(
        status: getResultStatus(isRegistered),
        iSDuplicated: VisibleTypeEx.fromBool(isRegistered),
      ),
    );
  }

  BaseBlocStatus getResultStatus(bool result) {
    return result ? BaseBlocStatus.failure() : BaseBlocStatus.success();
  }
}
