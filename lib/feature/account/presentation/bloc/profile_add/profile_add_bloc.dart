import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/account/domain/type/field_type.dart';
import 'package:withu/feature/common/common.dart';
import 'package:withu/shared/dialogs/dialogs.dart';

part 'profile_add_event.dart';

part 'profile_add_state.dart';

part 'profile_add_bloc.freezed.dart';

part 'profile_add_bloc_handler.dart';

typedef ProfileAddBlocProvider = BlocProvider<ProfileAddBloc>;

typedef ProfileAddBlocConsumer = BlocConsumer<ProfileAddBloc, ProfileAddState>;

typedef ProfileAddBlocBuilder = BlocBuilder<ProfileAddBloc, ProfileAddState>;

typedef ProfileAddBlocListener = BlocListener<ProfileAddBloc, ProfileAddState>;

class ProfileAddBloc extends Bloc<ProfileAddEvent, ProfileAddState> {
  final UploadImageUseCase uploadImageUseCase;
  final ProfileAddUseCase profileAddUseCase;

  ProfileAddBloc({
    required this.uploadImageUseCase,
    required this.profileAddUseCase,
  }) : super(ProfileAddState(status: BaseBlocStatus.initial())) {
    on<ProfileAddStepForwarded>(_onProfileAddStepForwarded);
    on<ProfileAddStepBackward>(_onProfileAddStepBackward);
    on<ProfileAddIntroductionInputted>(_onProfileAddIntroductionInputted);
    on<ProfileAddFieldSelected>(_onProfileAddFieldSelected);
    on<ProfileAddPhotoAddRequested>(_onProfileAddAddPhotoRequested);
    on<ProfileAddPhotoDeleted>(_onProfileAddPhotoDeleted);
    on<ProfileAddProfilePhotoPressed>(_onProfileAddProfilePhotoPressed);
    on<ProfileAddCareerAppended>(_onProfileAddAddCareerPressed);
    on<ProfileAddCareerDeleted>(_onProfileAddCareerDeleted);
    on<ProfileAddCareerReordered>(_onProfileAddCareerReordered);
    on<ProfileAddCareerFormClosed>(_onProfileAddCareerFormClosed);
    on<ProfileAddCareerSelected>(_onProfileAddCareerSelected);
    on<ProfileAddFormNameInputted>(_onProfileAddFormNameInputted);
    on<ProfileAddFormContentInputted>(_onProfileAddFormContentInputted);
    on<ProfileAddFormCompanyInputted>(_onProfileAddFormCompanyInputted);
    on<ProfileAddFormStartDateChanged>(_onProfileAddFormStartDateChanged);
    on<ProfileAddFormEndDateChanged>(_onProfileAddFormEndDateChanged);
    on<ProfileAddAreaAppend>(_onProfileAddAreaAppend);
    on<ProfileAddAreaDeleted>(_onProfileAddAreaDeleted);
  }
}
