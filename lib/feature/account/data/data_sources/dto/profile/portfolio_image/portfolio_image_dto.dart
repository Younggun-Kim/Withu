import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_image_dto.freezed.dart';

part 'portfolio_image_dto.g.dart';

typedef PortfolioImageListDto = List<PortfolioImageDto>;

@freezed
class PortfolioImageDto with _$PortfolioImageDto {
  const factory PortfolioImageDto({
    @Default('') String id,
    @Default('') String imageUrl,
    @Default(0) int orderIndex,
  }) = _PortfolioImageDto;

  factory PortfolioImageDto.fromJson(Map<String, dynamic> json) =>
      _$PortfolioImageDtoFromJson(json);
}

extension PortfolioImageListDtoMock on PortfolioImageListDto {
  static PortfolioImageListDto mock() {
    return [
      PortfolioImageDto(
        id: "323e4567-e89b-12d3-a456-426614174002",
        imageUrl:
            "<https://withu.uploader.s3.ap-northeast-2.amazonaws.com/portfolio/123e4567-e89b-12d3-a456-426614174000/image_1.jpg>",
        orderIndex: 0,
      ),
    ];
  }
}
