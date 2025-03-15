import 'package:json_annotation/json_annotation.dart';

/// 서버에 저장되는 이미지 타입
@JsonEnum(valueField: 'serverKey')
enum ServerImageType {
  profile('PORTFOLIO'),
  portfolio('PORTFOLIO'),
  etc('ETC');

  const ServerImageType(this.serverKey);

  final String serverKey;
}
