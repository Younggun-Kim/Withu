import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:withu/gen/assets.gen.dart' show Assets;
import 'package:withu/gen/colors.gen.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({super.key, this.backButton, this.trailing})
    : super(
        leading: backButton,
        actions: trailing,
        backgroundColor: ColorName.background,
        scrolledUnderElevation: 0,
      );

  /// 뒤로가기.
  factory CustomAppBar.back({
    required BuildContext context,
    List<Widget>? trailing,
  }) {
    return CustomAppBar(
      backButton: IconButton(
        icon: Assets.images.chevronLeft.svg(),
        onPressed: () {
          context.router.maybePop();
        },
      ),
      trailing: trailing,
    );
  }

  /// 뒤로가기.
  factory CustomAppBar.customActionBack({
    required BuildContext context,
    required VoidCallback onPressed,
    List<Widget>? trailing,
  }) {
    return CustomAppBar(
      backButton: IconButton(
        icon: Assets.images.chevronLeft.svg(),
        onPressed: onPressed,
      ),
      trailing: trailing,
    );
  }
  final Widget? backButton;

  final List<Widget>? trailing;
}
