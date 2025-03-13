import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/account/domain/type/field_type.dart';

part 'profile_registration_event.dart';

part 'profile_registration_state.dart';

part 'profile_registration_bloc.freezed.dart';

part 'profile_registration_bloc.handler.dart';

typedef ProfileRegistrationBlocProvider = BlocProvider<ProfileRegistrationBloc>;

typedef ProfileRegistrationBlocConsumer =
    BlocConsumer<ProfileRegistrationBloc, ProfileRegistrationState>;

typedef ProfileRegistrationBlocBuilder =
    BlocBuilder<ProfileRegistrationBloc, ProfileRegistrationState>;

typedef ProfileRegistrationBlocListener =
    BlocListener<ProfileRegistrationBloc, ProfileRegistrationState>;

class ProfileRegistrationBloc
    extends Bloc<ProfileRegistrationEvent, ProfileRegistrationState> {
  final ProfileRegistrationUseCase profileRegistrationUseCase;

  ProfileRegistrationBloc({required this.profileRegistrationUseCase})
    : super(ProfileRegistrationState(status: BaseBlocStatus.initial())) {
    on<ProfileRegistrationStepForwarded>(_onProfileRegistrationStepForwarded);
    on<ProfileRegistrationStepBackward>(_onProfileRegistrationStepBackward);
    on<ProfileRegistrationIntroductionInputted>(
      _onProfileRegistrationIntroductionInputted,
    );
    on<ProfileRegistrationFieldSelected>(_onProfileRegistrationFieldSelected);
    on<ProfileRegistrationAddPhotoRequested>(
      _onProfileRegistrationAddPhotoRequested,
    );
    on<ProfileRegistrationPhotoDeleted>(_onProfileRegistrationPhotoDeleted);
    on<ProfileRegistrationProfilePhotoPressed>(
      _onProfileRegistrationProfilePhotoPressed,
    );
  }
}
