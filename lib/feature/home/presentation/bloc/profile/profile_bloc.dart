import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';
import 'package:withu/core/router/router.gr.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/account/presentation/page/profile_add/profile_add.dart';

part 'profile_event.dart';

part 'profile_state.dart';

part 'profile_bloc.freezed.dart';

part 'profile_bloc.handler.dart';

typedef ProfileBlocProvider = BlocProvider<ProfileBloc>;

typedef ProfileBlocBuilder = BlocBuilder<ProfileBloc, ProfileState>;

typedef ProfileBlocListener = BlocListener<ProfileBloc, ProfileState>;

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase getProfileUseCase;

  ProfileBloc({required this.getProfileUseCase})
    : super(ProfileState(status: BaseBlocStatus.initial())) {
    on<ProfileInitialized>(_onProfileInitialized);
    on<ProfileRegistrationBtnPressed>(_onProfileRegistrationBtnPressed);
  }
}
