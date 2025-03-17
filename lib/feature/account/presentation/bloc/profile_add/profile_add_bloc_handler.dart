part of 'profile_add_bloc.dart';

typedef ProfileAddEmitter = Emitter<ProfileAddState>;

extension ProfileAddBlocHandler on ProfileAddBloc {
  /// 초기화
  void _onProfileAddInitialized(
    ProfileAddInitialized event,
    ProfileAddEmitter emit,
  ) {
    final entity = event.entity;
    emit(
      state.copyWith(
        introduction: entity.introduction,
        field: entity.field,
        portfolioImages: entity.portfolioImageUrls,
        careers: entity.careers,
        areas: entity.areas,
        profileImage: entity.profileImageUrl,
      ),
    );
  }

  /// 다음 스탭으로 이동
  void _onProfileAddStepForwarded(
    ProfileAddStepForwarded event,
    ProfileAddEmitter emit,
  ) async {
    final isCompany = getItGlobalBloc.state.isCompanyUser;
    final currentStep = state.currentStep;

    if (currentStep.isLast) {
      if (state.field.isNone) {
        Toast.showWithNavigatorKey(text: '분야를 선택해주세요.');
        return;
      }
      emit(state.copyWith(status: BaseBlocStatus.loading()));

      /// 1. 프로필 이미지 저장.
      final profileImageUrls = await getProfileImageUrl();

      /// 2. 포트폴리오 이미지 저장.
      final List<String> portfolioImageUrls = await getPortfolioImageUrls();

      /// 3. API 호출하기
      final response = await profileAddUseCase.exec(
        isCompany: isCompany,
        data: state.toUpdateValue(
          profileImageUrl: profileImageUrls,
          portfolioImageUrls: portfolioImageUrls,
        ),
      );

      emit(state.copyWith(status: BaseBlocStatus.fromSuccess(response)));
      if (response) {
        getItAppRouter.maybePop();
      }
    } else {
      emit(
        state.copyWith(currentStep: state.currentStep.getNextStep(isCompany)),
      );
    }
  }

  /// 다음 스탭으로 이동
  void _onProfileAddStepBackward(
    ProfileAddStepBackward event,
    ProfileAddEmitter emit,
  ) {
    if (state.currentStep.isFirst) {
      getItAppRouter.maybePop();
    } else {
      final isCompany = getItGlobalBloc.state.isCompanyUser;
      emit(
        state.copyWith(currentStep: state.currentStep.getPrevStep(isCompany)),
      );
    }
  }

  /// 자기소개 입력
  void _onProfileAddIntroductionInputted(
    ProfileAddIntroductionInputted event,
    ProfileAddEmitter emit,
  ) {
    emit(state.copyWith(introduction: event.introduction));
  }

  /// 필드 선택
  void _onProfileAddFieldSelected(
    ProfileAddFieldSelected event,
    ProfileAddEmitter emit,
  ) {
    emit(state.copyWith(field: event.field));
  }

  /// 사진 추가
  void _onProfileAddAddPhotoRequested(
    ProfileAddPhotoAddRequested event,
    ProfileAddEmitter emit,
  ) {
    if (state.isPortfolioFull) {
      return;
    }

    emit(
      state.copyWith(portfolioImages: [...state.portfolioImages, event.image]),
    );
  }

  /// 사진 삭제
  void _onProfileAddPhotoDeleted(
    ProfileAddPhotoDeleted event,
    ProfileAddEmitter emit,
  ) {
    emit(
      state.copyWith(
        portfolioImages:
            state.portfolioImages.where((file) => file != event.file).toList(),
      ),
    );
  }

  /// 프로필 사진 클릭
  void _onProfileAddProfilePhotoPressed(
    ProfileAddProfilePhotoPressed event,
    ProfileAddEmitter emit,
  ) {
    emit(state.copyWith(profileImage: event.image));
  }

  /// 경력 변경
  void _onProfileAddCareerUpdated(
    ProfileAddCareerUpdated event,
    ProfileAddEmitter emit,
  ) async {
    final newCareer = CareerEntity.deepCopy(event.entity);
    final newCareers =
        [
          ...state.careers,
        ].map((c) => c.isEqual(newCareer) ? newCareer : c).toList();

    emit(state.copyWith(careers: newCareers));
  }

  /// 경력 삭제
  void _onProfileAddCareerDeleted(
    ProfileAddCareerDeleted event,
    ProfileAddEmitter emit,
  ) async {
    final newCareers =
        state.careers.where((entity) => entity.id != event.entity.id).toList();
    emit(state.copyWith(careers: newCareers));
  }

  /// 경력 순서 변경
  void _onProfileAddCareerReordered(
    ProfileAddCareerReordered event,
    ProfileAddEmitter emit,
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

  /// 경력 이름 입력
  void _onProfileAddFormNameInputted(
    ProfileAddFormNameInputted event,
    ProfileAddEmitter emit,
  ) {
    emit(state.copyWith(careerFormName: event.name));
  }

  /// 경력 콘텐츠 입력
  void _onProfileAddFormContentInputted(
    ProfileAddFormContentInputted event,
    ProfileAddEmitter emit,
  ) {
    emit(state.copyWith(careerFormContent: event.content));
  }

  void _onProfileAddFormCompanyInputted(
    ProfileAddFormCompanyInputted event,
    ProfileAddEmitter emit,
  ) {
    emit(state.copyWith(careerFormCompany: event.company));
  }

  void _onProfileAddFormStartDateChanged(
    ProfileAddFormStartDateChanged event,
    ProfileAddEmitter emit,
  ) {
    String endDate = state.careerFormEndDate.value;

    final entity = state.careerFormEntity.copyWith(startDate: event.date);
    if (entity.isAfter() || entity.isEmptyEndDate) {
      endDate = event.date.value;
    }

    emit(
      state.copyWith(
        careerFormStartDate: event.date,
        careerFormEndDate: CareerDateValue(endDate),
      ),
    );
  }

  void _onProfileAddFormEndDateChanged(
    ProfileAddFormEndDateChanged event,
    ProfileAddEmitter emit,
  ) {
    String startDate = state.careerFormStartDate.value;

    final entity = state.careerFormEntity.copyWith(endDate: event.date);
    if (entity.isBefore()) {
      startDate = event.date.value;
    }
    emit(
      state.copyWith(
        careerFormStartDate: CareerDateValue(startDate),
        careerFormEndDate: event.date,
      ),
    );
  }

  /// 경력 폼 등록
  void _onProfileAddFormRegistered(
    ProfileAddFormRegistered event,
    ProfileAddEmitter emit,
  ) {
    final formEntity = state.careerFormEntity;
    emit(
      state.copyWith(
        careerFormName: NameValue(),
        careerFormContent: CareerContentValue(),
        careerFormCompany: CompanyNameValue(),
        careerFormStartDate: CareerDateValue(),
        careerFormEndDate: CareerDateValue(),
        careers: [...state.careers, formEntity],
      ),
    );
  }

  /// 지역 추가
  void _onProfileAddAreaAppend(
    ProfileAddAreaAppend event,
    ProfileAddEmitter emit,
  ) {
    if (state.isAreaFull) {
      return;
    }
    if (state.areas.contains(event.area)) {
      Toast.showWithNavigatorKey(text: '이미 등록된 지역입니다.');
      return;
    }
    emit(state.copyWith(areas: [...state.areas, event.area]));
  }

  /// 지역 삭제
  void _onProfileAddAreaDeleted(
    ProfileAddAreaDeleted event,
    ProfileAddEmitter emit,
  ) {
    if (state.areas.isEmpty || !state.areas.contains(event.area)) {
      return;
    }

    AreaEntities newAreas = [...state.areas];
    newAreas.removeWhere((area) => area.fullAddr == event.area.fullAddr);
    emit(state.copyWith(areas: newAreas));
  }
}

extension ProfileAddBlocHandlerEx on ProfileAddBloc {
  FutureOr<String> getProfileImageUrl() async {
    final profileImage = state.profileImage;
    final file = profileImage?.file;

    if (profileImage == null) return '';

    if (state.hasProfileUrl) return profileImage.url;

    if (file == null) return '';

    return await uploadImageUseCase.uploadProfile(file);
  }

  FutureOr<List<String>> getPortfolioImageUrls() async {
    final portfolioImages = [...state.portfolioImages];

    if (portfolioImages.isEmpty) return [];

    final hasFileImages = portfolioImages.getOnlyHasFile();
    final files = hasFileImages.toFile();
    final uploadedUrls = await uploadImageUseCase.uploadPortfolio(files);

    return portfolioImages
        .map((image) {
          if (image.hasFile && uploadedUrls.isNotEmpty) {
            return image.copyWith(url: uploadedUrls.removeAt(0));
          }
          return image;
        })
        .map((image) => image.url)
        .toList();
  }
}
