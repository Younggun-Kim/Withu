class SignUpPageArgs {
  /// 사업자등록 번호
  final String businessNum;

  /// 대표명
  final String ceoName;

  /// 회사명
  final String companyName;

  /// 위치 동의 여부
  final bool isAgreeLocation;

  /// 마케팅 동의 여부
  final bool isAgreeMarketing;

  SignUpPageArgs({
    required this.businessNum,
    required this.ceoName,
    required this.companyName,
    required this.isAgreeLocation,
    required this.isAgreeMarketing,
  });
}
