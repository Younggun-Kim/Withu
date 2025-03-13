import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/common/common.dart';

part 'my_profile_entity.freezed.dart';

/// 내 프로필 정보
@freezed
class MyProfileEntity with _$MyProfileEntity {
  const factory MyProfileEntity({
    required String id,
    required NameValue name,
    required BirthDateValue birthDate,
    required GenderType gender,
    required PhoneValue phone,
    required EmailValue email,
    required SignUpMethodType signUpMethod,
    required ChannelType channel,
    required bool locationInfoConsent,
    required bool marketingInfoConsent,
    required bool notificationEnabled,
    required ProfileStatusType profileStatus,
    required UserType userType,
    @Default(BusinessNumValue()) BusinessNumValue businessNumber,
    @Default(CompanyNameValue()) CompanyNameValue companyName,
  }) = _MyProfileEntity;

  const MyProfileEntity._();
}

extension MyProfileEntityEx on MyProfileEntity {
  bool get hasData => id.isNotEmpty;
}

extension MyProfileEntityParser on MyProfileEntity {
  static MyProfileEntity error() {
    return MyProfileEntity(
      id: '',
      name: NameValue(''),
      birthDate: BirthDateValue(''),
      gender: GenderType.none,
      phone: PhoneValue(''),
      email: EmailValue(''),
      signUpMethod: SignUpMethodType.none,
      channel: ChannelType.none,
      locationInfoConsent: false,
      marketingInfoConsent: false,
      notificationEnabled: false,
      profileStatus: ProfileStatusType.none,
      userType: UserType.none,
      businessNumber: BusinessNumValue(),
      companyName: CompanyNameValue(),
    );
  }

  static MyProfileEntity fromDto(MyProfileResData data) {
    return MyProfileEntity(
      id: data.id,
      name: NameValue(data.name),
      birthDate: BirthDateValue(data.birthDate.replaceAll('-', '')),
      gender: data.gender,
      phone: PhoneValue(data.phoneNo),
      email: EmailValue(data.email),
      signUpMethod: data.signUpMethod,
      channel: data.appAcquisitionChannel,
      locationInfoConsent: data.locationInfoConsent,
      marketingInfoConsent: data.marketingInfoConsent,
      notificationEnabled: data.notificationEnabled,
      profileStatus: data.profileStatus,
      userType: data.userType,
      businessNumber: BusinessNumValue(data.businessNumber),
      companyName: CompanyNameValue(data.companyName),
    );
  }
}
