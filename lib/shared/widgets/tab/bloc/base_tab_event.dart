part of 'base_tab_bloc.dart';

abstract class BaseTabEvent {}

/// 탭 클릭 이벤트
class OnSelectTap extends BaseTabEvent {

  OnSelectTap(this.selectedTab);
  final BaseTabData selectedTab;
}
