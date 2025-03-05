import 'package:flutter/material.dart';
import 'package:withu/core/core.dart';
import 'package:withu/gen/colors.gen.dart';

class SelectableIconBtn extends StatelessWidget {
  final bool isSelected;

  final String text;

  final Color backgroundColor;

  final Color selectedBackgroundColor;

  final Widget icon;

  final VoidCallback onTap;

  const SelectableIconBtn({
    super.key,
    required this.isSelected,
    required this.text,
    required this.icon,
    required this.onTap,
    this.backgroundColor = Colors.white,
    this.selectedBackgroundColor = ColorName.secondary,
  });

  @override
  Widget build(BuildContext context) {
    final Color textColor = isSelected ? Colors.white : ColorName.text;

    final Color bgColor =
        isSelected ? selectedBackgroundColor : backgroundColor;

    return InkWell(
      key: key,
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: ColorName.tertiary),
          borderRadius: BorderRadius.circular(10),
          color: bgColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 10),
            Text(
              text,
              style: context.textTheme.bodyMediumBold?.copyWith(
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
