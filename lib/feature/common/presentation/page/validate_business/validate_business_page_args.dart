class ValidateBusinessPageArgs {
  /// 위치 동의 여부
  final bool isAgreeLocation;

  /// 마케팅 동의 여부
  final bool isAgreeMarketing;

  const ValidateBusinessPageArgs({
    required this.isAgreeLocation,
    required this.isAgreeMarketing,
  });

  factory ValidateBusinessPageArgs.empty() {
    return ValidateBusinessPageArgs(
      isAgreeLocation: false,
      isAgreeMarketing: false,
    );
  }
}
