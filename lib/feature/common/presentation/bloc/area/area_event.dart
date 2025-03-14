part of 'area_bloc.dart';

abstract class AreaEvent extends BaseBlocEvent {}

/// 초기화
class AreaInitialized extends AreaEvent {}

/// 리셋
class AreaReset extends AreaEvent {}

/// 시도 선택
class AreaSidoSelected extends AreaEvent {
  final AreaEntity sido;

  AreaSidoSelected({required this.sido});
}

/// 시/군/구 선택
class AreaSggSelected extends AreaEvent {
  final AreaEntity sgg;

  AreaSggSelected({required this.sgg});
}

/// 읍/면/동 선택
class AreaEmdSelected extends AreaEvent {
  final AreaEntity emd;

  AreaEmdSelected({required this.emd});
}

/// 다음 버튼 클릭
class AreaSubmitted extends AreaEvent {}
