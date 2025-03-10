part of 'term_bloc.dart';

abstract class TermEvent extends BaseBlocEvent {}

/// 메시지 초기화
class TermMessageCleared extends TermEvent {}

/// Args 저장
class TermArgsStored extends TermEvent {
  final TermPageArgs args;

  TermArgsStored({required this.args});
}

/// 계정 타입 선택
class TermAccountTypeSelected extends TermEvent {
  final AccountType value;

  TermAccountTypeSelected({required this.value});
}

/// 화면 첫 번째 스텝 다음 버튼 클릭
class TermFirstNextPressed extends TermEvent {}

/// 화면 두 번째 스텝 다음 버튼 클릭
class TermSecondNextPressed extends TermEvent {}

/// 전체 동의 탭
class TermAllAgreementTapped extends TermEvent {
  final bool isChecked;

  TermAllAgreementTapped({required this.isChecked});
}

/// 필수 동의 탭
class TermRequiredAgreementTapped extends TermEvent {
  final bool isChecked;

  TermRequiredAgreementTapped({required this.isChecked});
}

/// 서비스이용약관 탭
class TermServiceAgreementTapped extends TermEvent {}

/// 서비스약관으로 이동
class TermShowServiceTermTapped extends TermEvent {}

/// 개인정보 탭
class TermPrivacyAgreementTapped extends TermEvent {}

/// 개인정보 이동
class TermShowPrivacyTermTapped extends TermEvent {}

/// 전자금융거래 탭
class TermFinanceAgreementTapped extends TermEvent {}

/// 전자금융거래 이동
class TermShowFinanceTermTapped extends TermEvent {}

/// 위치동의 탭
class TermLocationAgreementTapped extends TermEvent {}

/// 위치동의 이동
class TermShowLocationTermTapped extends TermEvent {}

/// 마케팅 탭
class TermMarketingAgreementTapped extends TermEvent {}

/// 마케팅 이동
class TermShowMarketingTermTapped extends TermEvent {}
