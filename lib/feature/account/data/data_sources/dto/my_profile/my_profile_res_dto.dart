import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';

part 'my_profile_res_dto.freezed.dart';

part 'my_profile_res_dto.g.dart';

typedef MyProfileResDto = BaseResponseDto<MyProfileResData>;

@freezed
class MyProfileResData with _$MyProfileResData {
  factory MyProfileResData({
    @Default('') String id,
    @Default('') String name,
    @Default('') String birthDate,
    @Default(GenderType.none) GenderType gender,
    @Default('') String phoneNo,
    @Default('') String email,
    @Default(SignUpMethodType.none) SignUpMethodType signUpMethod,
    @Default(ChannelType.none) ChannelType appAcquisitionChannel,
    @Default(false) bool locationInfoConsent,
    @Default(false) bool marketingInfoConsent,
    @Default(false) bool notificationEnabled,
    @Default('') String businessNumber,
    @Default('') String companyName,
    @Default(ProfileStatusType.none) ProfileStatusType profileStatus,
    @Default(UserType.none) UserType userType,
  }) = _MyProfileResData;

  factory MyProfileResData.fromJson(Map<String, dynamic> json) =>
      _$MyProfileResDataFromJson(json);
}

extension MyProfileResDtoMock on MyProfileResDto {
  static MyProfileResDto success() {
    return MyProfileResDto(
      success: true,
      data: MyProfileResData(
        id: 'fcf4dd83-4e4d-4687-94db-05e14db12041',
        name: '테스트',
        birthDate: '1997-05-06',
        gender: GenderType.male,
        phoneNo: '01012345678',
        email: 'gkwls0329@kakao.com',
        signUpMethod: SignUpMethodType.email,
        appAcquisitionChannel: ChannelType.instagram,
        locationInfoConsent: true,
        marketingInfoConsent: true,
        notificationEnabled: false,
        businessNumber: '',
        companyName: '',
        profileStatus: ProfileStatusType.incomplete,
        userType: UserType.company,
      ),
      message: ' 프로필 조회에 성공했습니다',
    );
  }
}
