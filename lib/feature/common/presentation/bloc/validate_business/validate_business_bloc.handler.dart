part of 'validate_business_bloc.dart';

typedef ValidateBusinessEmitter = Emitter<ValidateBusinessState>;

extension ValidateBusinessBlocHandler on ValidateBusinessBloc {
  void _onValidateBusinessNumInputted(
    ValidateBusinessNumInputted event,
    ValidateBusinessEmitter emit,
  ) {
    emit(state.copyWith(businessNum: event.value));
  }

  void _onValidateCeoNameInputted(
    ValidateCeoNameInputted event,
    ValidateBusinessEmitter emit,
  ) {
    emit(state.copyWith(ceoName: event.value));
  }

  void _onValidateCompanyNameInputted(
    ValidateCompanyNameInputted event,
    ValidateBusinessEmitter emit,
  ) {
    emit(state.copyWith(companyName: event.value));
  }

  void _onValidateOpenDateNameInputted(
    ValidateOpenDateNameInputted event,
    ValidateBusinessEmitter emit,
  ) {
    emit(state.copyWith(openDate: event.value));
  }
}
