import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withu/feature/account/data/data_sources/dto/find_id/find_id_res_dto.dart';

part 'find_id_res_value.freezed.dart';

@freezed
class FindIdResValue with _$FindIdResValue {
  const factory FindIdResValue({required bool success, required String email}) =
      _FindIdResValue;

  const FindIdResValue._();
}

extension FindIdResValueParser on FindIdResValue {
  static FindIdResValue fromDto(FindIdResDto dto) {
    return FindIdResValue(success: dto.success, email: dto.data?.email ?? '');
  }
}
