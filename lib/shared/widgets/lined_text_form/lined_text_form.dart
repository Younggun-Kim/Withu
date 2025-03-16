import 'package:flutter/material.dart';
import 'package:withu/core/core.dart';
import 'package:withu/gen/colors.gen.dart';

/// UnderLine이 있는 텍스트 폼
class LinedTextFormField extends StatelessWidget {
  final TextEditingController? controller;

  final FocusNode? focusNode;

  final Widget? suffix;

  final int lineNum;

  final bool readOnly;

  final String hint;

  final int? maxLength;

  final Function(String text)? onChanged;

  const LinedTextFormField({
    super.key,
    this.controller,
    this.focusNode,
    this.suffix,
    this.lineNum = 2,
    this.readOnly = false,
    this.hint = '',
    this.onChanged,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePainter(lineNum),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        style: context.textTheme.bodySmall?.copyWith(
          color: ColorName.text,
          height: 48 / 14,
        ),
        cursorHeight: 20,
        minLines: lineNum,
        maxLines: lineNum,
        maxLength: maxLength,
        readOnly: readOnly,
        onChanged: onChanged,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          border: InputBorder.none,
          suffix: suffix,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint,
          hintStyle: context.textTheme.bodySmall?.copyWith(
            color: ColorName.secondary,
            height: 48 / 14,
          ),
          counterText: '',
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final int lineNum;

  LinePainter(this.lineNum);

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = ColorName.tertiary
          ..strokeWidth = 1;

    // 줄 그리기
    for (var index in List.generate(lineNum, (index) => index)) {
      canvas.drawLine(
        Offset(0, 42 * (index + 1)),
        Offset(size.width, 42 * (index + 1)),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
