import 'package:flutter/cupertino.dart';
import 'package:withu/shared/shared.dart';

class SelectableBtn extends StatelessWidget {
  final String text;

  final bool isSelected;

  final VoidCallback onTap;

  const SelectableBtn({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? BaseButton.enabled(
          key: key,
          context: context,
          text: text,
          onTap: onTap,
        )
        : BaseButton.basic(
          key: key,
          text: text,
          onTap: onTap,
          context: context,
        );
  }
}
