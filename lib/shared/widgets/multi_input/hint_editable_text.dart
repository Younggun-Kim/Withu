import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:withu/core/core.dart';
import 'package:withu/gen/colors.gen.dart';

class HintEditableText extends StatelessWidget {
  final Object groupId;

  final String hintText;

  final bool isVisibleHint;

  final TextEditingController controller;

  final FocusNode focusNode;

  final TextInputType keyboardType;

  final List<TextInputFormatter>? inputFormatters;

  final ValueChanged<String> onChanged;

  const HintEditableText({
    super.key,
    required this.groupId,
    required this.controller,
    required this.focusNode,
    required this.keyboardType,
    required this.onChanged,
    this.hintText = '',
    this.isVisibleHint = false,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: isVisibleHint,
          child: SizedBox(
            width: double.infinity,
            child: Text(
              hintText,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyLarge?.copyWith(
                color: ColorName.secondary,
              ),
            ),
          ),
        ),
        EditableText(
          groupId: groupId,
          controller: controller,
          focusNode: focusNode,
          textInputAction: TextInputAction.next,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: ColorName.text,
            letterSpacing: -0.5,
            height: 1.6,
          ),
          cursorColor: ColorName.primary,
          backgroundCursorColor: ColorName.primary,
          keyboardType: TextInputType.number,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
