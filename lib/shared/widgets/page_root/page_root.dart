import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:withu/gen/colors.gen.dart';

class PageRoot extends StatelessWidget {
  const PageRoot({
    super.key,
    required this.child,
    required this.isLoading,
    this.appBar,
    this.fab,
    this.padding,
    this.safeAreaTop = true,
    this.safeAreaBottom = true,
    this.bottomNavigationBar,
  });

  final Widget child;

  final bool isLoading;

  final PreferredSizeWidget? appBar;

  final FloatingActionButton? fab;

  final EdgeInsets? padding;

  final bool safeAreaTop;

  final bool safeAreaBottom;

  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Stack(
        children: [
          Scaffold(
            appBar: appBar,
            floatingActionButton: fab,
            backgroundColor: ColorName.background,
            bottomNavigationBar: bottomNavigationBar,
            body: SafeArea(
              top: safeAreaTop,
              bottom: safeAreaBottom,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: padding,
                child: child,
              ),
            ),
          ),
          Visibility(
            visible: isLoading,
            child: const Center(
              child: CircularProgressIndicator(color: ColorName.primary),
            ),
          ),
        ],
      ),
    );
  }
}
