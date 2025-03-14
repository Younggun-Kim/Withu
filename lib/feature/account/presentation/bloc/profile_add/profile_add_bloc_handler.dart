part of 'profile_add_bloc.dart';

typedef ProfileAddEmitter = Emitter<ProfileAddState>;

extension ProfileAddBlocHandler on ProfileAddBloc {
  /// 다음 스탭으로 이동
  void _onProfileAddStepForwarded(
    ProfileAddStepForwarded event,
    ProfileAddEmitter emit,
  ) {
    final isCompany = getItGlobalBloc.state.isCompanyUser;
    emit(state.copyWith(currentStep: state.currentStep.getNextStep(isCompany)));
  }

  /// 다음 스탭으로 이동
  void _onProfileAddStepBackward(
    ProfileAddStepBackward event,
    ProfileAddEmitter emit,
  ) {
    final isCompany = getItGlobalBloc.state.isCompanyUser;
    emit(state.copyWith(currentStep: state.currentStep.getPrevStep(isCompany)));
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
      state.copyWith(portfolioImages: [...state.portfolioImages, event.file]),
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

  /// 경력 추가하기 클릭
  void _onProfileAddAddCareerPressed(
    ProfileAddCareerAppended event,
    ProfileAddEmitter emit,
  ) async {
    final newCareer = CareerEntity.temp();
    emit(
      state.copyWith(
        hasNewCareer: true,
        careers: [newCareer, ...state.careers],
        careerFormData: newCareer,
      ),
    );
  }

  /// 경력 삭제
  void _onProfileAddCareerDeleted(
    ProfileAddCareerDeleted event,
    ProfileAddEmitter emit,
  ) async {
    final newCareers =
        state.careers.where((entity) => entity.id != event.entity.id).toList();
    final isEqualFormData = state.careerFormData == event.entity;
    emit(
      state.copyWith(
        careers: newCareers,
        hasNewCareer: isEqualFormData ? false : state.hasNewCareer,
        careerFormData: isEqualFormData ? CareerEntity() : state.careerFormData,
      ),
    );
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

  /// 경력 입력 폼 접기
  void _onProfileAddCareerFormClosed(
    ProfileAddCareerFormClosed event,
    ProfileAddEmitter emit,
  ) {
    emit(state.copyWith(hasNewCareer: false, careerFormData: CareerEntity()));
  }

  /// 경력 선택
  void _onProfileAddCareerSelected(
    ProfileAddCareerSelected event,
    ProfileAddEmitter emit,
  ) {
    emit(state.copyWith(careerFormData: event.entity, hasNewCareer: true));
  }

  /// 경력 이름 입력
  void _onProfileAddFormNameInputted(
    ProfileAddFormNameInputted event,
    ProfileAddEmitter emit,
  ) {
    final newFormData = state.careerFormData.copyWith(name: event.name);
    emit(
      state.copyWith(
        careerFormData: newFormData,
        careers: _getCareersWithCareerForm(newFormData),
      ),
    );
  }

  void _onProfileAddFormContentInputted(
    ProfileAddFormContentInputted event,
    ProfileAddEmitter emit,
  ) {
    final newFormData = state.careerFormData.copyWith(content: event.content);

    emit(
      state.copyWith(
        careerFormData: newFormData,
        careers: _getCareersWithCareerForm(newFormData),
      ),
    );
  }

  void _onProfileAddFormCompanyInputted(
    ProfileAddFormCompanyInputted event,
    ProfileAddEmitter emit,
  ) {
    final newFormData = state.careerFormData.copyWith(
      companyName: event.company,
    );
    emit(
      state.copyWith(
        careerFormData: newFormData,
        careers: _getCareersWithCareerForm(newFormData),
      ),
    );
  }

  void _onProfileAddFormStartDateChanged(
    ProfileAddFormStartDateChanged event,
    ProfileAddEmitter emit,
  ) {
    CareerEntity newFormData = state.careerFormData.copyWith(
      startDate: event.date,
    );

    if (newFormData.isAfter() || newFormData.isEmptyEndDate) {
      newFormData = newFormData.copyWith(endDate: event.date);
    }

    emit(
      state.copyWith(
        careerFormData: newFormData,
        careers: _getCareersWithCareerForm(newFormData),
      ),
    );
  }

  void _onProfileAddFormEndDateChanged(
    ProfileAddFormEndDateChanged event,
    ProfileAddEmitter emit,
  ) {
    CareerEntity newFormData = state.careerFormData.copyWith(
      endDate: event.date,
    );

    if (newFormData.isBefore()) {
      newFormData = newFormData.copyWith(startDate: event.date);
    }
    emit(
      state.copyWith(
        careerFormData: newFormData,
        careers: _getCareersWithCareerForm(newFormData),
      ),
    );
  }

  /// CareerForm이 반영된 Careers 얻기
  List<CareerEntity> _getCareersWithCareerForm(CareerEntity newCareer) {
    return [...state.careers]
        .map(
          (oldCareer) => oldCareer.id == newCareer.id ? newCareer : oldCareer,
        )
        .toList();
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
    newAreas.removeWhere((area) => area.cd == event.area.cd);
    emit(state.copyWith(areas: newAreas));
  }
}
