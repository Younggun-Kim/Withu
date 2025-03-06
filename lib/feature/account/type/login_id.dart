import 'package:equatable/equatable.dart';

abstract class LoginId extends Equatable {
  const LoginId({required this.value});

  final String value;

  bool get isValid;
}
