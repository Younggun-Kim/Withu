import 'package:flutter/cupertino.dart';
import 'package:withu/shared/shared.dart';

class EnabledBtn extends StatelessWidget {
  final String text;

  final bool isEnabled;

  final VoidCallback onTap;

  const EnabledBtn({
    super.key,
    required this.text,
    required this.isEnabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return isEnabled
        ? BaseButton.enabled(
          key: key,
          text: text,
          onTap: onTap,
          context: context,
        )
        : BaseButton.disabled(
          key: key,
          text: text,
          onTap: () {},
          context: context,
        );
  }
}
