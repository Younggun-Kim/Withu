import 'package:withu/feature/account/account.dart';

class SignUpPageArgs {
  /// 계정 타입
  final UserType userType;

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

  /// 회원가입 종류
  final SignUpMethodType signUpType;

  /// SnS 회원가입 임시 토큰
  final String tempToken;

  SignUpPageArgs({
    required this.userType,
    required this.businessNum,
    required this.ceoName,
    required this.companyName,
    required this.isAgreeLocation,
    required this.isAgreeMarketing,
    this.signUpType = SignUpMethodType.email,
    this.tempToken = '',
  });

  factory SignUpPageArgs.user({
    required bool isAgreeLocation,
    required bool isAgreeMarketing,
    SignUpMethodType signUpType = SignUpMethodType.email,
    String tempToken = '',
  }) {
    return SignUpPageArgs(
      userType: UserType.staff,
      businessNum: '',
      ceoName: '',
      companyName: '',
      isAgreeLocation: isAgreeLocation,
      isAgreeMarketing: isAgreeMarketing,
      signUpType: signUpType,
      tempToken: tempToken,
    );
  }

  factory SignUpPageArgs.company({
    required String businessNum,
    required String ceoName,
    required String companyName,
    required bool isAgreeLocation,
    required bool isAgreeMarketing,
    SignUpMethodType signUpType = SignUpMethodType.email,
    String tempToken = '',
  }) {
    return SignUpPageArgs(
      userType: UserType.company,
      businessNum: businessNum,
      ceoName: ceoName,
      companyName: companyName,
      isAgreeLocation: isAgreeLocation,
      isAgreeMarketing: isAgreeMarketing,
      signUpType: signUpType,
      tempToken: tempToken,
    );
  }
}
