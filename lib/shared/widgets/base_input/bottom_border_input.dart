import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:withu/core/core.dart';
import 'package:withu/gen/colors.gen.dart';
import 'package:withu/shared/shared.dart';

class BottomBorderInput extends StatelessWidget {
  const BottomBorderInput({
    super.key,
    this.controller,
    this.focusNode,
    this.width,
    this.style,
    this.hintText,
    this.hintTextStyle,
    this.padding,
    this.onChanged,
    this.onEditingComplete,
    this.suffix,
    this.suffixText,
    this.suffixStyle,
    this.keyboardType,
    this.textInputAction,
    this.maxLength,
    this.textAlign = TextAlign.start,
    this.inputFormatters,
    this.obscureText = false,
    this.errorText = '',
    this.errorVisible = false,
  });

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final double? width;

  final TextStyle? style;

  final String? hintText;

  final TextStyle? hintTextStyle;

  final EdgeInsets? padding;

  final Widget? suffix;

  final String? suffixText;

  final TextStyle? suffixStyle;

  final TextInputType? keyboardType;

  final TextInputAction? textInputAction;

  final int? maxLength;

  final TextAlign textAlign;

  final bool obscureText;

  final Function(String)? onChanged;

  final VoidCallback? onEditingComplete;

  final List<TextInputFormatter>? inputFormatters;

  final String errorText;

  final bool errorVisible;

  @override
  Widget build(BuildContext context) {
    return BaseInput(
      controller: controller,
      focusNode: focusNode,
      width: width,
      style: style,
      hintText: hintText,
      hintTextStyle: hintTextStyle,
      padding: padding,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      suffix: suffix,
      suffixText: suffixText,
      suffixStyle: suffixStyle,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      maxLength: maxLength,
      textAlign: textAlign,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      errorText: errorText,
      errorVisible: errorVisible,
      borderRadius: 0,
      border: Border(bottom: BorderSide(color: ColorName.tertiary)),
    );
  }

  factory BottomBorderInput.basic({
    required BuildContext context,
    TextEditingController? controller,
    FocusNode? focusNode,
    String? hintText,
    TextInputAction? textInputAction,
    Function(String)? onChanged,
  }) {
    return BottomBorderInput(
      controller: controller,
      focusNode: focusNode,
      hintText: hintText,
      textInputAction: textInputAction,
      padding: EdgeInsets.symmetric(horizontal: 0),
      onChanged: onChanged,
      hintTextStyle: context.textTheme.bodySmall?.setSecondary,
      style: context.textTheme.bodySmallBold?.setBlack,
    );
  }
}
