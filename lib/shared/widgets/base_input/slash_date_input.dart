import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:withu/shared/shared.dart';

class SlashDateInput extends StatefulWidget {
  final TextEditingController controller;

  final FocusNode focusNode;

  final Function(String) onChanged;

  const SlashDateInput({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  @override
  State<StatefulWidget> createState() => _SlashDateInputState();
}

class _SlashDateInputState extends State<SlashDateInput> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_formatBusinessNumber);
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(_formatBusinessNumber);
    widget.controller.dispose();
    widget.focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseInput(
      controller: widget.controller,
      focusNode: widget.focusNode,
      hintText: 'YYYY / MM / DD',
      maxLength: 8,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: widget.onChanged,
    );
  }

  /// initState에서 controller에 리스너 등록
  ///
  /// ```dart
  /// controller.addListener(_formatBusinessNumber);
  /// ```
  void _formatBusinessNumber() {
    String text = widget.controller.text.replaceAll(
      RegExp(r'\D'),
      '',
    ); // 숫자만 남김
    String formattedText = _applyFormat(text);

    if (widget.controller.text != formattedText) {
      widget.controller.value = TextEditingValue(
        text: formattedText,
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    }
  }

  /// 숫자 문자열에 슬래쉬 추가
  String _applyFormat(String digits) {
    if (digits.isEmpty) return '';

    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      if (i == 4 || i == 6) buffer.write('/');
      buffer.write(digits[i]);
    }

    return buffer.toString();
  }
}
