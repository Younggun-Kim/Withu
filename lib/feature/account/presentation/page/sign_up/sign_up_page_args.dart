import 'package:withu/feature/account/domain/type/account_type.dart';

class SignUpPageArgs {
  /// 계정 타입
  final AccountType accountType;

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
    required this.accountType,
    required this.businessNum,
    required this.ceoName,
    required this.companyName,
    required this.isAgreeLocation,
    required this.isAgreeMarketing,
  });

  factory SignUpPageArgs.user({
    required bool isAgreeLocation,
    required bool isAgreeMarketing,
  }) {
    return SignUpPageArgs(
      accountType: AccountType.user,
      businessNum: '',
      ceoName: '',
      companyName: '',
      isAgreeLocation: isAgreeLocation,
      isAgreeMarketing: isAgreeMarketing,
    );
  }

  factory SignUpPageArgs.company({
    required String businessNum,
    required String ceoName,
    required String companyName,
    required bool isAgreeLocation,
    required bool isAgreeMarketing,
  }) {
    return SignUpPageArgs(
      accountType: AccountType.company,
      businessNum: businessNum,
      ceoName: ceoName,
      companyName: companyName,
      isAgreeLocation: isAgreeLocation,
      isAgreeMarketing: isAgreeMarketing,
    );
  }
}
