part of 'area_bloc.dart';

enum AreaSelectStep { sido, sgg, emd }

@freezed
class AreaState extends BaseBlocState with _$AreaState {
  factory AreaState({
    /// 상태.
    required BaseBlocStatus status,

    /// 선택 단계
    @Default(AreaSelectStep.sido) AreaSelectStep step,

    /// 시도
    @Default([]) AreaEntities sidos,

    /// 선택한 시도
    AreaEntity? selectedSido,

    /// 시/군/구
    @Default([]) AreaEntities sgg,

    /// 선택한 시/군/구
    AreaEntity? selectedSgg,

    /// 읍/면/동
    @Default([]) AreaEntities emd,

    /// 선택한 읍/면/동
    AreaEntity? selectedEmd,

    /// 선택한 읍/면/동
    AreaEntity? submitArea,
  }) = _AreaState;
}

extension AreaStateEx on AreaState {}
