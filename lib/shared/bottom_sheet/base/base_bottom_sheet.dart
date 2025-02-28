import 'package:flutter/material.dart';
import 'package:withu/core/core.dart';
import 'package:withu/gen/colors.gen.dart';
import 'package:withu/shared/shared.dart';

/// 기본 바텀 시트
class BaseBottomSheet extends StatelessWidget {
  final EdgeInsets padding;

  final Widget child;

  const BaseBottomSheet({
    super.key,
    required this.padding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: padding,
            decoration: BoxDecoration(
              color: ColorName.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: child,
          ),
          const SizedBox(height: 10),
          BaseButton(
            text: Text(
              StringRes.cancel.tr,
              style: context.textTheme.bodyMediumBold?.copyWith(
                color: ColorName.primary,
              ),
            ),
            backgroundColor: ColorName.tertiary,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
