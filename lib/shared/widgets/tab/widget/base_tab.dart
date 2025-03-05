import 'package:flutter/material.dart';
import 'package:withu/core/utils/extensions/theme_ext.dart';
import 'package:withu/gen/colors.gen.dart';
import 'package:withu/shared/shared.dart';

/// 탭 아이템
class BaseTab extends StatelessWidget {

  const BaseTab({
    super.key,
    required this.data,
    required this.isSelected,
    required this.onTap,
  });
  final BaseTabData data;

  final bool isSelected;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textColor = isSelected ? ColorName.primary : ColorName.secondary;
    final borderColor = isSelected ? ColorName.primary : Colors.transparent;

    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: borderColor, width: 3)),
        ),
        child: Text(
          data.text,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyLargeBold?.copyWith(color: textColor),
        ),
      ),
    );
  }
}
