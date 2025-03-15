import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/account/domain/type/field_type.dart';

part 'profile_detail_entity.freezed.dart';

/// 프로필 상세 Entity
@freezed
class ProfileDetailEntity with _$ProfileDetailEntity {
  const factory ProfileDetailEntity({
    @Default('') String id,
    @Default('') String introduction,
    @Default(FieldType.none) FieldType field,
    @Default('') String profileImageUrl,
    @Default([]) CareerEntities careers,
    @Default([]) List<String> areas,
  }) = _ProfileDetailEntity;

  const ProfileDetailEntity._();
}

extension ProfileDetailEntityEx on ProfileDetailEntity {
  bool get isEmpty => id.isEmpty;
}

extension ProfileDetailEntityParser on ProfileDetailEntity {
  // TODO 지역 파싱 추가
  static ProfileDetailEntity fromDto(ProfileDetailResData dto) {
    return ProfileDetailEntity(
      id: dto.id,
      introduction: dto.introduction,
      field: dto.field,
      profileImageUrl: dto.profileImageUrl,
      careers: CareerEntitiesParser.fromDto(dto.careers),
      areas:
          dto.preferredLocations.map((location) => location.district).toList(),
    );
  }

  static ProfileDetailEntity empty() {
    return ProfileDetailEntity();
  }
}
