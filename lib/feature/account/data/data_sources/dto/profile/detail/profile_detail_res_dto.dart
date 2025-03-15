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
    @Default([]) List<String> portfolioImages,
    @Default([]) CareerListDto careers,
  }) = _ProfileDetailResData;

  factory ProfileDetailResData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDetailResDataFromJson(json);
}

extension ProfileDetailResDtoMock on ProfileDetailResDto {}
