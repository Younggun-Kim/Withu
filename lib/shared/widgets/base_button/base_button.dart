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
    this.border,
    this.isEnabled = true,
    this.width = double.infinity,
    this.height = 50,
    this.padding = EdgeInsets.zero,
    this.borderRadius = 10,
  });

  final double? width;

  final double? height;

  final Widget text;

  final Color backgroundColor;

  final Border? border;

  final double borderRadius;

  final VoidCallback onTap;

  final bool isEnabled;

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius),
      onTap: isEnabled ? onTap : () {},
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
        ),
        child: text,
      ),
    );
  }

  factory BaseButton.basic({
    Key? key,
    required BuildContext context,
    required String text,
    required VoidCallback onTap,
    Color textColor = ColorName.background,
  }) {
    return BaseButton(
      key: key,
      text: Text(
        text,
        style: context.textTheme.bodySmallBold?.copyWith(color: textColor),
      ),
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

  /// Padding에 맞춘 버튼
  factory BaseButton.fit({
    required BuildContext context,
    required String text,
    required VoidCallback onTap,
    Color textColor = ColorName.primary,
    Color backgroundColor = Colors.white,
    Border? border,
  }) {
    return BaseButton(
      width: null,
      height: null,
      borderRadius: 50,
      text: Text(
        text,
        style: context.textTheme.bodySmallBold?.copyWith(color: textColor),
      ),
      padding: EdgeInsets.symmetric(vertical: 5.5, horizontal: 13),
      backgroundColor: backgroundColor,
      border: border ?? Border.all(color: ColorName.tertiary),
      onTap: onTap,
    );
  }

  factory BaseButton.fitSecondary({
    required BuildContext context,
    required String text,
    required VoidCallback onTap,
  }) {
    return BaseButton.fit(
      context: context,
      text: text,
      onTap: onTap,
      textColor: Colors.white,
      backgroundColor: ColorName.secondary,
      border: Border.all(color: ColorName.secondary),
    );
  }
}
