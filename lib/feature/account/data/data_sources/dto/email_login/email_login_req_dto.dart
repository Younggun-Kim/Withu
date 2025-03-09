import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_login_req_dto.freezed.dart';

part 'email_login_req_dto.g.dart';

@freezed
class EmailLoginReqData with _$EmailLoginReqData {
  factory EmailLoginReqData({
    required String email,
    required String password,
    required String userType,
  }) = _EmailLoginReqData;

  factory EmailLoginReqData.fromJson(Map<String, dynamic> json) =>
      _$EmailLoginReqDataFromJson(json);
}
