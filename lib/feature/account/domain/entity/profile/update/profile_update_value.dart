import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/account/domain/type/field_type.dart';
import 'package:withu/feature/common/domain/entity/area/area_entity.dart';

part 'profile_update_value.freezed.dart';

/// 프로필 등록/수정 value
@freezed
class ProfileUpdateValue with _$ProfileUpdateValue {
  const factory ProfileUpdateValue({
    @Default('') String introduction,
    @Default(FieldType.none) FieldType field,
    @Default('') String profileImageUrl,
    @Default([]) List<String> portfolioImageUrls,
    @Default([]) CareerEntities careers,
    @Default([]) AreaEntities areas,
  }) = _ProfileUpdateValue;

  const ProfileUpdateValue._();
}

extension ProfileUpdateValueParser on ProfileUpdateValue {
  // TODO: 지역 파싱하기
  ProfileUpdateReqDto toDto() {
    return ProfileUpdateReqDto(
      profile: ProfileDto(introduction: introduction, field: field),
      profileImageUrl: profileImageUrl,
      portfolioImageUrls: portfolioImageUrls,
      careers: careers.toDto(),
      preferredLocations: [],
    );
  }
}
