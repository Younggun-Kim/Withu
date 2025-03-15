part of 'area_bloc.dart';

typedef AreaEmitter = Emitter<AreaState>;

extension AreaBlocHandler on AreaBloc {
  /// 초기화
  void _onAreaInitialized(AreaInitialized event, AreaEmitter emit) async {
    final sidos = await areaUseCase.getSido();
    emit(AreaState(status: BaseBlocStatus.initial(), sidos: sidos));
  }

  /// 리셋
  void _onAreaReset(AreaReset event, AreaEmitter emit) async {
    emit(
      state.copyWith(
        step: AreaSelectStep.sido,
        sgg: [],
        emd: [],
        selectedSido: null,
        selectedSgg: null,
        selectedEmd: null,
        submitArea: null,
      ),
    );
  }

  /// 시도 선택
  void _onAreaSidoSelected(AreaSidoSelected event, AreaEmitter emit) async {
    emit(state.copyWith(selectedSido: event.sido));
    final sggs = await areaUseCase.getSgg(event.sido);
    emit(state.copyWith(step: AreaSelectStep.sgg, sgg: sggs));
  }

  void _onAreaSggSelected(AreaSggSelected event, AreaEmitter emit) async {
    emit(state.copyWith(selectedSgg: event.sgg));
    // final emds = await areaUseCase.getEmd(event.sgg);
    emit(
      state.copyWith(
        selectedSgg: event.sgg,
        // step: AreaSelectStep.emd,
        // emd: emds,
      ),
    );
  }

  void _onAreaEmdSelected(AreaEmdSelected event, AreaEmitter emit) {
    emit(state.copyWith(selectedEmd: event.emd));
  }

  void _onAreaSubmitted(AreaSubmitted event, AreaEmitter emit) {
    emit(state.copyWith(submitArea: state.selectedEmd));
  }
}
