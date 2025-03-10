import 'package:withu/core/core.dart';

class TermPageArgs {
  final LoginType type;

  final String tempToken;

  const TermPageArgs({required this.type, this.tempToken = ''});
}
