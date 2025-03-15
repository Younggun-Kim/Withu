import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/account/domain/type/field_type.dart';

part 'profile_detail_res_dto.freezed.dart';

part 'profile_detail_res_dto.g.dart';

typedef ProfileDetailResDto = BaseResponseDto<ProfileDetailResData>;

@freezed
class ProfileDetailResData with _$ProfileDetailResData {
  factory ProfileDetailResData({
    @Default('') String id,
    @Default('') String introduction,
    @Default(FieldType.none) FieldType field,
    @Default('') String profileImageUrl,
    @Default([]) PortfolioImageListDto portfolioImages,
    @Default([]) CareerListDto careers,
    @Default([]) PreferredLocationListDto preferredLocations,
  }) = _ProfileDetailResData;

  factory ProfileDetailResData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDetailResDataFromJson(json);
}

extension ProfileDetailResDtoMock on ProfileDetailResDto {
  static ProfileDetailResDto success() {
    return ProfileDetailResDto(
      success: true,
      message: '프로필 조회 성공',
      errorCode: '',
      data: ProfileDetailResData(
        id: 'temp-profile-id',
        introduction: '자기소개입니다.',
        field: FieldType.foodStyling,
        profileImageUrl:
            'https://withu.uploader.s3.ap-northeast-2.amazonaws.com/profiles/123e4567-e89b-12d3-a456-426614174000/image.jpg',
        portfolioImages: PortfolioImageListDtoMock.mock(),
        careers: CareerListDtoMock.mock(),
      ),
    );
  }
}
