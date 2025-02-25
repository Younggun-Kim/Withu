import 'package:equatable/equatable.dart';
import 'package:withu/core/utils/regex/regex_util.dart';

/// 휴대폰번호 Value Object
class Phone extends Equatable {
  final String value;

  const Phone(this.value);

  static const empty = Phone('');

  @override
  List<Object?> get props => [value];

  @override
  String toString() => value;

  bool get isValid => RegExUtil.phonePattern.hasMatch(value);
}
