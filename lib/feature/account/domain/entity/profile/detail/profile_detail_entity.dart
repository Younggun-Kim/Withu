import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/account/domain/type/field_type.dart';
import 'package:withu/feature/common/domain/entity/area/area_entity.dart';

part 'profile_detail_entity.freezed.dart';

/// 프로필 상세 Entity
@freezed
class ProfileDetailEntity with _$ProfileDetailEntity {
  const factory ProfileDetailEntity({
    @Default('') String id,
    @Default(IntroductionValue()) IntroductionValue introduction,
    @Default(FieldType.none) FieldType field,
    @Default(ImageFileValue()) ImageFileValue profileImageUrl,
    @Default([]) List<ImageFileValue> portfolioImageUrls,
    @Default([]) CareerEntities careers,
    @Default([]) AreaEntities areas,
  }) = _ProfileDetailEntity;

  const ProfileDetailEntity._();
}

extension ProfileDetailEntityEx on ProfileDetailEntity {
  bool get isEmpty => id.isEmpty;

  String get firstPortfolioImageUrl =>
      portfolioImageUrls.firstOrNull?.url ?? '';

  List<String> get portfolioSubImageUrls {
    if (portfolioImageUrls.length <= 1) {
      return [];
    }
    return portfolioImageUrls
        .sublist(1)
        .map((portfolio) => portfolio.url)
        .toList();
  }
}

extension ProfileDetailEntityParser on ProfileDetailEntity {
  static ProfileDetailEntity fromDto(ProfileDetailResData dto) {
    return ProfileDetailEntity(
      id: dto.id,
      introduction: IntroductionValue(dto.introduction),
      field: dto.field,
      profileImageUrl: ImageFileValue(url: dto.profileImageUrl),
      careers: CareerEntitiesParser.fromDto(dto.careers),
      portfolioImageUrls:
          dto.portfolioImages
              .map((portfolio) => ImageFileValue(url: portfolio.imageUrl))
              .toList(),
      areas:
          dto.preferredLocations
              .map(
                (location) => AreaEntity(
                  addrName: location.city,
                  fullAddr: location.district,
                ),
              )
              .toList(),
    );
  }

  static ProfileDetailEntity empty() {
    return ProfileDetailEntity();
  }
}
