import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_id_req_dto.freezed.dart';

part 'find_id_req_dto.g.dart';

@freezed
class FindIdReqDto with _$FindIdReqDto {
  factory FindIdReqDto({
    required String phoneNo,
    @Default(true) bool success,
    @Default('') String message,
  }) = _FindIdReqDto;

  factory FindIdReqDto.fromJson(Map<String, dynamic> json) =>
      _$FindIdReqDtoFromJson(json);
}
