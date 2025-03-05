import 'package:equatable/equatable.dart';

/// 인증번호 Value Object
class AuthCode extends Equatable {

  const AuthCode(this.value);
  final String value;

  static const empty = AuthCode('');

  @override
  List<Object?> get props => [value];

  bool get isValid => value.length == 6;
}
