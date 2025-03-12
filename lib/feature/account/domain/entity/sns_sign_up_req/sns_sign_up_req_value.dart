import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/account/data/data_sources/dto/sns_sign_up/sns_sign_up.dart';

part 'sns_sign_up_req_value.freezed.dart';

@freezed
class SnsSignUpReqValue with _$SnsSignUpReqValue {
  factory SnsSignUpReqValue({
    required String tempToken,
    required String name,
    required String birthDate,
    required GenderType gender,
    required String phoneNo,
    required String businessNumber,
    required String companyName,
    required ChannelType appAcquisitionChannel,
    required bool locationInfoConsent,
    required bool marketingInfoConsent,
  }) = _SnsSignUpReqValue;
}

extension SnsSignUpReqValueParser on SnsSignUpReqValue {
  SnsSignUpReqDto toDto() {
    return SnsSignUpReqDto(
      token: tempToken,
      name: name,
      birthDate: birthDate,
      gender: gender.serverKey,
      phoneNo: phoneNo,
      businessNumber: businessNumber,
      companyName: companyName,
      appAcquisitionChannel: appAcquisitionChannel.serverKey,
      locationInfoConsent: locationInfoConsent,
      marketingInfoConsent: marketingInfoConsent,
    );
  }
}
