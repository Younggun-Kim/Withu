part of 'term_bloc.dart';

abstract class TermEvent extends BaseBlocEvent {}

/// 메시지 초기화
class TermMessageCleared extends TermEvent {}

/// 계정 타입 선택
class TermAccountTypeSelected extends TermEvent {
  final AccountType value;

  TermAccountTypeSelected({required this.value});
}

/// 화면 첫 번째 스텝 다음 버튼 클릭
class TermFirstNextPressed extends TermEvent {}

/// 화면 두 번쨰 스텝 다음 버튼 클릭
class TermSecondNextPressed extends TermEvent {}
