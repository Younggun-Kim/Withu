import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/feature/account/account.dart';

part 'company_sign_up_entity.freezed.dart';

@freezed
class CompanySignUpEntity with _$CompanySignUpEntity {
  factory CompanySignUpEntity({
    required String name,
    required String birthDate,
    required GenderType gender,
    required String phoneNo,
    required String email,
    required String password,
    required SignUpMethodType signUpMethod,
    required String businessNumber,
    required String companyName,
    required bool locationInfoConsent,
    required bool marketingInfoConsent,
  }) = _CompanySignUpEntity;
}
