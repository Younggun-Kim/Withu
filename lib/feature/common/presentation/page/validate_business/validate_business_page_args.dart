class ValidateBusinessPageArgs {
  /// 위치 동의 여부
  final bool isAgreeLocation;

  /// 마케팅 동의 여부
  final bool isAgreeMarketing;

  /// SNS를 위한 임시 토큰
  final String snsTempToken;

  const ValidateBusinessPageArgs({
    required this.isAgreeLocation,
    required this.isAgreeMarketing,
    this.snsTempToken = '',
  });

  factory ValidateBusinessPageArgs.empty() {
    return ValidateBusinessPageArgs(
      isAgreeLocation: false,
      isAgreeMarketing: false,
    );
  }
}
