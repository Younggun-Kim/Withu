import 'package:flutter/material.dart';
import 'package:withu/core/utils/utils.dart';

class CustomAlertDialog extends StatelessWidget {

  const CustomAlertDialog({
    super.key,
    this.title = '',
    this.content = '',
    this.actions,
  });

  /// Content 만 있는 Alert
  factory CustomAlertDialog.contentAlert({
    required String content,
    VoidCallback? onPressed,
  }) {
    return CustomAlertDialog(content: content);
  }
  final String title;

  final String content;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title:
          title.isNotEmpty
              ? Text(content, style: context.textTheme.bodyMediumBold)
              : null,
      content:
          content.isNotEmpty
              ? Text(content, style: context.textTheme.bodySmall)
              : null,
      actions: actions,
    );
  }

  /// Content Alert 보기
  static Future showContentAlert({
    required BuildContext context,
    required String content,
    VoidCallback? closeCallback,
  }) {
    return showDialog(
      context: context,
      builder: (context) => CustomAlertDialog.contentAlert(content: content),
    ).then((_) {
      if (closeCallback != null) {
        closeCallback();
      }
    });
  }
}
