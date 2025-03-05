import 'package:flutter/material.dart';
import 'package:withu/core/core.dart';
import 'package:withu/gen/colors.gen.dart';

class RadioChip extends StatelessWidget {

  const RadioChip({
    super.key,
    required this.text,
    required this.isSelected,
    this.enabled = true,
    this.onSelected,
    this.margin,
  });
  final String text;

  final bool isSelected;

  final bool enabled;

  final VoidCallback? onSelected;

  final EdgeInsets? margin;

  Color get backgroundColor => isSelected ? ColorName.primary : Colors.white;

  Color get textColor => isSelected ? Colors.white : ColorName.primary;

  BoxBorder? get border =>
      isSelected ? null : Border.all(color: ColorName.tertiary);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: InkWell(
        onTap: enabled ? onSelected : () {},
        borderRadius: BorderRadius.circular(50),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
          decoration: BoxDecoration(
            color: backgroundColor,
            border: border,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            text,
            style: context.textTheme.bodySmallBold?.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
