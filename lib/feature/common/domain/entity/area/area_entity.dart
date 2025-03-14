import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/feature/common/data/data_source/dto/area/area_res_dto.dart';

part 'area_entity.freezed.dart';

@freezed
class AreaEntity with _$AreaEntity {
  const factory AreaEntity({
    @Default('') String cd,
    @Default('') String addrName,
    @Default('') String fullAddr,
    @Default(false) bool isSelected,
  }) = _AreaEntity;

  const AreaEntity._();
}

extension AreaEntityParser on AreaEntity {
  static List<AreaEntity> fromDto(AreaResDto dto) {
    return dto.data
            ?.map(
              (data) => AreaEntity(
                cd: data.cd,
                addrName: data.addrName,
                fullAddr: data.fullAddr,
              ),
            )
            .toList() ??
        [];
  }
}
