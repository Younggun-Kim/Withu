part of 'profile_bloc.dart';

extension ProfileBlocHandler on ProfileBloc {
  /// 정보 등록하기 클릭
  _onProfileRegistrationBtnPressed(
    ProfileRegistrationBtnPressed event,
    Emitter<ProfileState> emit,
  ) {
    getItAppRouter.push(ProfileAddRoute());
  }
}
