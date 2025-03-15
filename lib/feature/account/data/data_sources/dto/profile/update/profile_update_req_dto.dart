import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/feature/account/data/data_sources/dto/profile/career/career_dto.dart';

import '../preferred_location/preferred_location_dto.dart';
import '../profile/profile_dto.dart';

part 'profile_update_req_dto.freezed.dart';

part 'profile_update_req_dto.g.dart';

@Freezed()
class ProfileUpdateReqDto with _$ProfileUpdateReqDto {
  factory ProfileUpdateReqDto({
    ProfileDto? profile,
    @Default('') String profileImageUrl,
    @Default([]) List<String> portfolioImageUrls,
    @Default([]) CareerListDto careers,
    @Default([]) PreferredLocationListDto preferredLocations,
  }) = _ProfileUpdateReqDto;

  factory ProfileUpdateReqDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileUpdateReqDtoFromJson(json);
}
