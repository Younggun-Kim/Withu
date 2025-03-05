import 'package:flutter/material.dart';
import 'package:withu/core/core.dart';
import 'package:withu/gen/colors.gen.dart';

class IconBtn extends StatelessWidget {
  final String text;

  final Color backgroundColor;

  final Widget icon;

  final VoidCallback onTap;

  const IconBtn({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: key,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: ColorName.tertiary),
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 10),
            Text(
              text,
              style: context.textTheme.bodyMediumBold?.copyWith(
                color: ColorName.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
