import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferred_location_dto.freezed.dart';

part 'preferred_location_dto.g.dart';

typedef PreferredLocationListDto = List<PreferredLocationDto>;

@freezed
class PreferredLocationDto with _$PreferredLocationDto {
  const factory PreferredLocationDto({
    @Default('') String city,
    @Default('') String district,
    @Default(0) int orderIndex,
  }) = _PreferredLocationDto;

  factory PreferredLocationDto.fromJson(Map<String, dynamic> json) =>
      _$PreferredLocationDtoFromJson(json);
}

extension PreferredLocationListDtoMock on PreferredLocationListDto {
  static PreferredLocationListDto mock() {
    return [
      PreferredLocationDto(city: '서울특별시', district: '서울특별시 동작구'),
      PreferredLocationDto(city: '경기도', district: '경기도 성남시'),
    ];
  }
}
