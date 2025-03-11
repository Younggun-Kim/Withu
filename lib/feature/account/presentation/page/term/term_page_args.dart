import 'package:withu/core/core.dart';

class TermPageArgs {
  final LoginType type;

  final String tempToken;

  const TermPageArgs({required this.type, this.tempToken = ''});

  factory TermPageArgs.email() => TermPageArgs(type: LoginType.email);
}
