part of 'profile_registration_bloc.dart';

typedef ProfileRegistrationEmitter = Emitter<ProfileRegistrationState>;

extension ProfileRegistrationBlocHandler on ProfileRegistrationBloc {
  /// 다음 스탭으로 이동
  void _onProfileRegistrationStepForwarded(
    ProfileRegistrationStepForwarded event,
    ProfileRegistrationEmitter emit,
  ) {
    final isCompany = getItGlobalBloc.state.isCompanyUser;
    emit(state.copyWith(currentStep: state.currentStep.getNextStep(isCompany)));
  }

  /// 다음 스탭으로 이동
  void _onProfileRegistrationStepBackward(
    ProfileRegistrationStepBackward event,
    ProfileRegistrationEmitter emit,
  ) {
    final isCompany = getItGlobalBloc.state.isCompanyUser;
    emit(state.copyWith(currentStep: state.currentStep.getPrevStep(isCompany)));
  }

  /// 자기소개 입력
  void _onProfileRegistrationIntroductionInputted(
    ProfileRegistrationIntroductionInputted event,
    ProfileRegistrationEmitter emit,
  ) {
    emit(state.copyWith(introduction: event.introduction));
  }

  /// 필드 선택
  void _onProfileRegistrationFieldSelected(
    ProfileRegistrationFieldSelected event,
    ProfileRegistrationEmitter emit,
  ) {
    emit(state.copyWith(field: event.field));
  }

  /// 사진 추가
  void _onProfileRegistrationAddPhotoRequested(
    ProfileRegistrationAddPhotoRequested event,
    ProfileRegistrationEmitter emit,
  ) {
    if (state.isPortfolioFull) {
      return;
    }

    emit(
      state.copyWith(portfolioImages: [...state.portfolioImages, event.file]),
    );
  }

  /// 사진 삭제
  void _onProfileRegistrationPhotoDeleted(
    ProfileRegistrationPhotoDeleted event,
    ProfileRegistrationEmitter emit,
  ) {
    emit(
      state.copyWith(
        portfolioImages:
            state.portfolioImages.where((file) => file != event.file).toList(),
      ),
    );
  }

  /// 프로필 사진 클릭
  void _onProfileRegistrationProfilePhotoPressed(
    ProfileRegistrationProfilePhotoPressed event,
    ProfileRegistrationEmitter emit,
  ) {
    emit(state.copyWith(profileImage: event.image));
  }

  /// 경력 추가하기 클릭
  void _onProfileRegistrationAddCareerPressed(
    ProfileRegistrationAddCareerPressed event,
    ProfileRegistrationEmitter emit,
  ) async {
    final tempId = await nanoid();
    emit(
      state.copyWith(
        hasNewCareer: true,
        careers: [CareerEntity(id: tempId), ...state.careers],
      ),
    );
  }

  /// 경력 삭제
  void _onProfileRegistrationCareerDeleted(
    ProfileRegistrationCareerDeleted event,
    ProfileRegistrationEmitter emit,
  ) async {
    final newCareers =
        state.careers.where((entity) => entity.id != event.entity.id).toList();
    emit(state.copyWith(careers: newCareers));
  }

  /// 경력 순서 변경
  void _onProfileRegistrationCareerReordered(
    ProfileRegistrationCareerReordered event,
    ProfileRegistrationEmitter emit,
  ) async {
    final oldIndex = event.oldIndex;
    final newIndex = event.newIndex;
    final newCareers = [...state.careers];
    final reorderedCareer = newCareers.removeAt(oldIndex);
    newCareers.insert(
      newIndex > oldIndex ? newIndex - 1 : newIndex,
      reorderedCareer,
    );

    emit(state.copyWith(careers: newCareers));
  }
}
