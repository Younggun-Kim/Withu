part of 'term_bloc.dart';

extension TermBlocHandler on TermBloc {
  /// 계정 타입 선택 이벤트.
  void _onTermAccountTypeSelected(
    TermAccountTypeSelected event,
    Emitter<TermState> emit,
  ) {
    emit(state.copyWith(accountType: event.value));
  }

  void _onTermStepBackPressed(
    TermStepBackPressed event,
    Emitter<TermState> emit,
  ) {
    if (!state.step.isFirst) {
      emit(state.copyWith(step: TermPageStepType.first));
    } else {
      getItAppRouter.maybePop();
    }
  }

  void _onTermFirstNextPressed(
    TermFirstNextPressed event,
    Emitter<TermState> emit,
  ) {
    emit(state.copyWith(step: TermPageStepType.second));
  }

  void _onTermSecondNextPressed(
    TermSecondNextPressed event,
    Emitter<TermState> emit,
  ) async {
    state.accountType.iSCompany ? _moveCompanyNextPage() : _moveUserNextPage();
  }

  void _moveCompanyNextPage() {
    getItAppRouter.push(
      ValidateBusinessRoute(
        args: ValidateBusinessPageArgs(
          isAgreeLocation: state.locationTerm,
          isAgreeMarketing: state.marketingTerm,
        ),
      ),
    );
  }

  void _moveUserNextPage() async {
    final signUpArgsValue = getItGlobalBloc.state.signUpArgs;
    getItAppRouter.push(
      SignUpRoute(
        args: SignUpPageArgs.user(
          signUpType: signUpArgsValue.signUpMethod,
          tempToken: signUpArgsValue.tempToken,
          isAgreeLocation: state.locationTerm,
          isAgreeMarketing: state.marketingTerm,
        ),
      ),
    );
  }

  void _onTermAllAgreementTapped(
    TermAllAgreementTapped event,
    Emitter<TermState> emit,
  ) {
    emit(
      state.copyWith(
        serviceTerm: event.isChecked,
        privacyTerm: event.isChecked,
        financeTerm: event.isChecked,
        locationTerm: event.isChecked,
        marketingTerm: event.isChecked,
      ),
    );
  }

  void _onTermRequiredAgreementTapped(
    TermRequiredAgreementTapped event,
    Emitter<TermState> emit,
  ) {
    emit(
      state.copyWith(
        serviceTerm: event.isChecked,
        privacyTerm: event.isChecked,
        financeTerm: event.isChecked,
      ),
    );
  }

  void _onTermServiceAgreementTapped(
    TermServiceAgreementTapped event,
    Emitter<TermState> emit,
  ) {
    emit(state.copyWith(serviceTerm: !state.serviceTerm));
  }

  void _onTermShowServiceTermTapped(
    TermShowServiceTermTapped event,
    Emitter<TermState> emit,
  ) {}

  void _onTermPrivacyAgreementTapped(
    TermPrivacyAgreementTapped event,
    Emitter<TermState> emit,
  ) {
    emit(state.copyWith(privacyTerm: !state.privacyTerm));
  }

  void _onTermShowPrivacyTermTapped(
    TermShowPrivacyTermTapped event,
    Emitter<TermState> emit,
  ) {}

  void _onTermFinanceAgreementTapped(
    TermFinanceAgreementTapped event,
    Emitter<TermState> emit,
  ) {
    emit(state.copyWith(financeTerm: !state.financeTerm));
  }

  void _onTermShowFinanceTermTapped(
    TermShowFinanceTermTapped event,
    Emitter<TermState> emit,
  ) {}

  void _onTermLocationAgreementTapped(
    TermLocationAgreementTapped event,
    Emitter<TermState> emit,
  ) {
    emit(state.copyWith(locationTerm: !state.locationTerm));
  }

  void _onTermShowLocationTermTapped(
    TermShowLocationTermTapped event,
    Emitter<TermState> emit,
  ) {}

  void _onTermMarketingAgreementTapped(
    TermMarketingAgreementTapped event,
    Emitter<TermState> emit,
  ) {
    emit(state.copyWith(marketingTerm: !state.marketingTerm));
  }

  void _onTermShowMarketingTermTapped(
    TermShowMarketingTermTapped event,
    Emitter<TermState> emit,
  ) {}
}
