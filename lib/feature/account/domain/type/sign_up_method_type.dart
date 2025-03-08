import 'package:freezed_annotation/freezed_annotation.dart';

/// 성별 타입
@JsonEnum(valueField: 'serverKey')
enum SignUpMethodType {
  none(serverKey: ''),
  email(serverKey: 'EMAIL'),
  google(serverKey: 'GOOGLE'),
  apple(serverKey: 'APPLE');

  final String serverKey;

  const SignUpMethodType({required this.serverKey});

  bool get isNone => this == none;
}
