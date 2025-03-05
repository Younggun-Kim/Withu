part of 'base_tab_bloc.dart';

class BaseTabState<T> {

  BaseTabState({required this.tabs, this.selectedTab});
  final List<BaseTabData<T>> tabs;
  final BaseTabData<T>? selectedTab;

  BaseTabState copyWith({
    List<BaseTabData<T>>? tabs,
    BaseTabData<T>? selectedTab,
  }) {
    return BaseTabState(
      tabs: tabs ?? this.tabs,
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }
}
