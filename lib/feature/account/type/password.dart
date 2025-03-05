import 'package:equatable/equatable.dart';
import 'package:withu/core/utils/regex/regex.dart';

/// 비밀번호 Value Object
class Password extends Equatable {

  const Password(this.value);
  final String value;

  static const empty = Password('');

  @override
  List<Object?> get props => [value];

  bool get isValid => RegExUtil.passwordPattern.hasMatch(value);
}
