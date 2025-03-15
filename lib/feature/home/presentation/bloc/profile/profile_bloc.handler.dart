part of 'profile_bloc.dart';

typedef ProfileEmitter = Emitter<ProfileState>;

extension ProfileBlocHandler on ProfileBloc {
  /// 초기화
  void _onProfileInitialized(
    ProfileInitialized event,
    ProfileEmitter emit,
  ) async {
    final isCompany = getItGlobalBloc.state.isCompanyUser;
    final profileData = await getProfileUseCase.exec(isCompany);
    emit(ProfileState(status: BaseBlocStatus.initial(), profile: profileData));
  }

  /// 정보 등록하기 클릭
  void _onProfileRegistrationBtnPressed(
    ProfileRegistrationBtnPressed event,
    ProfileEmitter emit,
  ) {
    getItAppRouter.push(
      ProfileAddRoute(args: ProfileAddPageArgs(entity: state.profile)),
    );
  }
}
