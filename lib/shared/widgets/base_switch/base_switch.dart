import 'package:flutter/material.dart';
import 'package:withu/gen/colors.gen.dart';

class BaseSwitch extends StatelessWidget {

  const BaseSwitch({
    super.key,
    required this.isOn,
    required this.onTap,
    this.width = 32.0,
    this.height = 16,
  });
  final bool isOn;

  final VoidCallback onTap;

  final double width;

  final double height;

  Color get trackColor => isOn ? ColorName.primary : ColorName.background;

  Color get thumbColor => isOn ? ColorName.background : ColorName.primary;

  Alignment get align => isOn ? Alignment.centerRight : Alignment.centerLeft;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: width,
        height: height,
        padding: const EdgeInsets.all(2),
        alignment: align,
        decoration: BoxDecoration(
          color: trackColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: ColorName.primary, width: 2),
        ),
        child: Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: thumbColor, shape: BoxShape.circle),
        ),
      ),
    );
  }
}
