import 'package:flutter/material.dart';

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
