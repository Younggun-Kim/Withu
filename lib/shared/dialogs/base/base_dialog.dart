import 'package:flutter/material.dart';
import 'package:withu/gen/colors.gen.dart';

class BaseDialog extends StatelessWidget {
  final bool isVisibleClose;

  final EdgeInsets padding;

  final Widget child;

  const BaseDialog({
    super.key,
    required this.child,
    this.isVisibleClose = true,
    this.padding = const EdgeInsets.all(18),
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorName.background,
      clipBehavior: Clip.hardEdge,
      child: IntrinsicHeight(
        child: Stack(
          children: [
            Visibility(
              visible: isVisibleClose,
              child: Positioned(
                top: 0,
                right: 10,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
            ),
            Container(width: double.infinity, padding: padding, child: child),
          ],
        ),
      ),
    );
  }
}
