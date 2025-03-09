import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(valueField: 'serverKey')
enum LoginType {
  email(serverKey: 'EMAIL'),
  google(serverKey: 'GOOGLE'),
  apple(serverKey: 'APPLE');

  final String serverKey;

  const LoginType({required this.serverKey});
}
