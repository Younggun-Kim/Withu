import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/feature/account/domain/type/field_type.dart';

part 'profile_dto.freezed.dart';

part 'profile_dto.g.dart';

@freezed
class ProfileDto with _$ProfileDto {
  const factory ProfileDto({
    @Default('') String introduction,
    @Default(FieldType.none) FieldType field,
  }) = _ProfileDto;

  factory ProfileDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileDtoFromJson(json);
}
