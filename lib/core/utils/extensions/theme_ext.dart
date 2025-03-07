import 'package:flutter/material.dart';
import 'package:withu/gen/colors.gen.dart';

extension BulidContextTextThemeExt on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension TextThemeEx on TextTheme {
  TextStyle? get bodyLargeBold =>
      bodyLarge?.copyWith(fontWeight: FontWeight.w600);

  TextStyle? get bodyMediumBold =>
      bodyMedium?.copyWith(fontWeight: FontWeight.w600);

  TextStyle? get bodySmallBold =>
      bodySmall?.copyWith(fontWeight: FontWeight.w600);
}

extension TextStyleEx on TextStyle {
  TextStyle get setBlack => copyWith(color: ColorName.text);

  TextStyle get setSecondary => copyWith(color: ColorName.secondary);

  TextStyle get setPoint => copyWith(color: ColorName.point);

  TextStyle get setTransparent => copyWith(color: Colors.transparent);
}
