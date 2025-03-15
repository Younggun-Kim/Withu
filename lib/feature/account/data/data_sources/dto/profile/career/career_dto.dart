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

extension CareerListDtoMock on CareerListDto {
  static CareerListDto mock() {
    return [
      CareerDto(
        id: "223e4567-e89b-12d3-a456-426614174001",
        title: "수석 푸드 스타일리스트",
        description: "다양한 촬영 및 스타일링 경험",
        companyName: "ABC 스튜디오",
        startDate: "2018-03-01",
        endDate: "2022-12-31",
        orderIndex: 0,
      ),
    ];
  }
}
