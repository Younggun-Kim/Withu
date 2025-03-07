import 'package:flutter/material.dart';
import 'package:withu/core/utils/utils.dart';
import 'package:withu/gen/colors.gen.dart';

/// 기본 버튼
class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.onTap,
    this.isEnabled = true,
    this.border,
  });

  factory BaseButton.basic({
    Key? key,
    required BuildContext context,
    required String text,
    required VoidCallback onTap,
  }) {
    return BaseButton(
      key: key,
      text: Text(text, style: context.textTheme.bodySmallBold),
      backgroundColor: Colors.white,
      border: Border.all(color: ColorName.tertiary),
      onTap: onTap,
    );
  }

  /// enabled 버튼
  factory BaseButton.enabled({
    required BuildContext context,
    required String text,
    required VoidCallback onTap,
    Key? key,
  }) {
    return BaseButton(
      key: key,
      text: Text(
        text,
        style: context.textTheme.bodyMediumBold?.copyWith(
          color: ColorName.background,
        ),
      ),
      border: Border.all(color: ColorName.secondary),
      backgroundColor: ColorName.secondary,
      onTap: onTap,
    );
  }

  /// disabled 버튼
  factory BaseButton.disabled({
    required BuildContext context,
    required String text,
    required VoidCallback onTap,
    Key? key,
  }) {
    return BaseButton(
      key: key,
      isEnabled: false,
      text: Text(
        text,
        style: context.textTheme.bodyMediumBold?.copyWith(
          color: ColorName.secondary,
        ),
      ),
      border: Border.all(color: ColorName.tertiary),
      backgroundColor: ColorName.tertiary,
      onTap: onTap,
    );
  }

  final Widget text;

  final Color backgroundColor;

  final Border? border;

  final VoidCallback onTap;

  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: isEnabled ? onTap : () {},
      child: Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: border,
        ),
        child: text,
      ),
    );
  }
}
