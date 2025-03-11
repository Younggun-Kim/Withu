import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(valueField: 'serverKey')
enum LoginType {
  none(serverKey: ''),
  email(serverKey: 'EMAIL'),
  google(serverKey: 'GOOGLE'),
  apple(serverKey: 'APPLE');

  final String serverKey;

  const LoginType({required this.serverKey});

  static LoginType from(String? name) {
    return values.firstWhere(
      (type) => type.serverKey == name,
      orElse: () => LoginType.none,
    );
  }

  bool get isNone => this == none;

  bool get isEmail => this == email;

  bool get isSns => this != email;
}
