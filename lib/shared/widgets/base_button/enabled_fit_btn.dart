import 'package:flutter/cupertino.dart';
import 'package:withu/shared/shared.dart';

class EnabledFitBtn extends StatelessWidget {
  final String text;

  final bool isEnabled;

  final VoidCallback onTap;

  const EnabledFitBtn({
    super.key,
    required this.text,
    required this.isEnabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return isEnabled
        ? BaseButton.fitSecondary(text: text, onTap: onTap, context: context)
        : BaseButton.fitTertiary(text: text, onTap: () {}, context: context);
  }
}
