import 'package:freezed_annotation/freezed_annotation.dart';

part 'portfolio_image_dto.freezed.dart';

part 'portfolio_image_dto.g.dart';

typedef PortfolioImageDtoListDto = List<PortfolioImageDto>;

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
