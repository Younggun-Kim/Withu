part of 'profile_registration_bloc.dart';

typedef ProfileRegistrationEmitter = Emitter<ProfileRegistrationState>;

extension ProfileRegistrationBlocHandler on ProfileRegistrationBloc {
  /// 다음 스탭으로 이동
  void _onProfileRegistrationStepForwarded(
    ProfileRegistrationStepForwarded event,
    ProfileRegistrationEmitter emit,
  ) {
    final isCompany = true;
    emit(state.copyWith(currentStep: state.currentStep.getNextStep(isCompany)));
  }

  /// 다음 스탭으로 이동
  void _onProfileRegistrationStepBackward(
    ProfileRegistrationStepBackward event,
    ProfileRegistrationEmitter emit,
  ) {
    final isCompany = true;
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
}
