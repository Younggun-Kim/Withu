import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';
import 'package:withu/core/router/router.gr.dart';
import 'package:withu/feature/home/domain/usecase/profile/profile_usecase.dart';

part 'profile_event.dart';

part 'profile_state.dart';

part 'profile_bloc.freezed.dart';

part 'profile_bloc.handler.dart';

typedef ProfileBlocProvider = BlocProvider<ProfileBloc>;

typedef ProfileBlocBuilder = BlocBuilder<ProfileBloc, ProfileState>;

typedef ProfileBlocListener = BlocListener<ProfileBloc, ProfileState>;

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileUseCase profileUseCase;

  ProfileBloc({required this.profileUseCase})
    : super(ProfileState(status: BaseBlocStatus.initial())) {
    on<ProfileRegistrationBtnPressed>(_onProfileRegistrationBtnPressed);
  }
}
