part of 'find_account_bloc.dart';

extension FindAccountBlocHandler on FindAccountBloc {
  void _onFindAccountLoadingOn(
    FindAccountLoadingOn event,
    Emitter<FindAccountState> emit,
  ) {
    emit(state.copyWith(status: BaseBlocStatus.loading()));
  }

  void _onFindAccountLoadingOff(
    FindAccountLoadingOff event,
    Emitter<FindAccountState> emit,
  ) {
    emit(state.copyWith(status: BaseBlocStatus.initial()));
  }

  void _onFindAccountNameInputted(
    FindAccountNameInputted event,
    Emitter<FindAccountState> emit,
  ) {
    emit(state.copyWith(name: event.name));
  }

  void _onFindAccountPhoneNumInputted(
    FindAccountPhoneNumInputted event,
    Emitter<FindAccountState> emit,
  ) {
    emit(state.copyWith(phone: event.value));
  }

  void _onFindAccountPhoneVerifyChanged(
    FindAccountPhoneVerifyChanged event,
    Emitter<FindAccountState> emit,
  ) {
    emit(state.copyWith(isPhoneVerify: event.value));
  }

  void _onFindAccountEmailInputted(
    FindAccountEmailInputted event,
    Emitter<FindAccountState> emit,
  ) {
    emit(state.copyWith(email: event.email));
  }

  void _onFindAccountPageTypeChanged(
    FindAccountPageTypeChanged event,
    Emitter<FindAccountState> emit,
  ) {
    emit(state.copyWith(pageType: event.type));
  }

  void _onFindAccountFindIdPressed(
    FindAccountFindIdPressed event,
    Emitter<FindAccountState> emit,
  ) async {
    // TODO: 아이디 찾기 API
    final response = 'test@test.com';
    final isFound = false;

    /// 아이디 찾기 성공시 화면 이동
    getItAppRouter.popAndPush(
      FindIdResultRoute(
        args: FindIdResultPageArgs(
          isFound: isFound,
          name: state.name.value,
          email: response,
        ),
      ),
    );
  }

  void _onFindAccountFindPasswordPressed(
    FindAccountFindPasswordPressed event,
    Emitter<FindAccountState> emit,
  ) {
    // TODO: 비밀번호 찾기 API
  }
}
