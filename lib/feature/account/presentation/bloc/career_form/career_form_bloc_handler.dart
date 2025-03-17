part of 'career_form_bloc.dart';

extension CareerFormBlocHandler on CareerFormBloc {
  void _onCareerFormInitialized(
    CareerFormInitialized event,
    Emitter<CareerFormState> emit,
  ) {
    emit(
      state.copyWith(
        careerId: event.entity.id,
        name: event.entity.name,
        content: event.entity.content,
        company: event.entity.companyName,
        startDate: event.entity.startDate,
        endDate: event.entity.endDate,
      ),
    );
  }

  void _onCareerFormNameInputted(
    CareerFormNameInputted event,
    Emitter<CareerFormState> emit,
  ) {
    emit(state.copyWith(name: event.name));
  }

  void _onCareerFormContentInputted(
    CareerFormContentInputted event,
    Emitter<CareerFormState> emit,
  ) {
    emit(state.copyWith(content: event.content));
  }

  void _onCareerFormCompanyInputted(
    CareerFormCompanyInputted event,
    Emitter<CareerFormState> emit,
  ) {
    emit(state.copyWith(company: event.company));
  }

  void _onCareerFormStartDateChanged(
    CareerFormStartDateChanged event,
    Emitter<CareerFormState> emit,
  ) {
    String endDate = state.endDate.value;

    final entity = state.getCareerEntity().copyWith(startDate: event.date);
    if (entity.isAfter() || entity.isEmptyEndDate) {
      endDate = event.date.value;
    }

    emit(
      state.copyWith(startDate: event.date, endDate: CareerDateValue(endDate)),
    );
  }

  void _onCareerFormEndDateChanged(
    CareerFormEndDateChanged event,
    Emitter<CareerFormState> emit,
  ) {
    String startDate = state.startDate.value;

    final entity = state.getCareerEntity().copyWith(endDate: event.date);
    if (entity.isBefore()) {
      startDate = event.date.value;
      logger.w(startDate);
    }
    emit(
      state.copyWith(
        startDate: CareerDateValue(startDate),
        endDate: event.date,
      ),
    );
  }

  void _onCareerFormUpdated(
    CareerFormUpdated event,
    Emitter<CareerFormState> emit,
  ) {}

  void _onCareerFormDeleted(
    CareerFormDeleted event,
    Emitter<CareerFormState> emit,
  ) {}
}
