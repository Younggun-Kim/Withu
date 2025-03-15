import 'package:freezed_annotation/freezed_annotation.dart';

part 'career_dto.freezed.dart';

part 'career_dto.g.dart';

typedef CareerListDto = List<CareerDto>;

@freezed
class CareerDto with _$CareerDto {
  const factory CareerDto({
    @Default('') String id,
    @Default('') String title,
    @Default('') String description,
    @Default('') String companyName,
    @Default('') String startDate,
    @Default('') String endDate,
    @Default(0) int orderIndex,
  }) = _CareerDto;

  factory CareerDto.fromJson(Map<String, dynamic> json) =>
      _$CareerDtoFromJson(json);
}
