import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:withu/core/core.dart';
import 'package:withu/gen/colors.gen.dart';

import 'hint_editable_text.dart';

/// yyyy / MM / dd 형식의 입력
class YmdInput extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const YmdInput({super.key, required this.onChanged});

  @override
  State<StatefulWidget> createState() => _YmdInputState();
}

class _YmdInputState extends State<YmdInput> {
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _dayController = TextEditingController();

  final FocusNode _yearFocusNode = FocusNode();
  final FocusNode _monthFocusNode = FocusNode();
  final FocusNode _dayFocusNode = FocusNode();

  final Object _groupId = Object();

  bool isVisibleYearHint = true;
  bool isVisibleMonthHint = true;
  bool isVisibleDayHint = true;

  String get value {
    final String yearValue = _yearController.text;

    final String monthValue = _monthController.text;

    final String dayValue = _dayController.text;
    return '$yearValue$monthValue$dayValue';
  }

  @override
  void initState() {
    super.initState();
    _yearController.addListener(_listenYear);
    _monthController.addListener(_listenMonth);
    _dayController.addListener(_listenDay);
  }

  @override
  void dispose() {
    _yearController.removeListener(_listenYear);
    _monthController.removeListener(_listenMonth);
    _dayController.removeListener(_listenDay);
    _yearController.dispose();
    _monthController.dispose();
    _dayController.dispose();
    _yearFocusNode.dispose();
    _monthFocusNode.dispose();
    _dayFocusNode.dispose();
    super.dispose();
  }

  void _listenYear() {
    setState(() {
      isVisibleYearHint = _yearController.text.isEmpty;
    });

    if (_yearController.text.length == 4 && _yearFocusNode.hasFocus) {
      _monthFocusNode.requestFocus();
    }
  }

  void _listenMonth() {
    setState(() {
      isVisibleMonthHint = _monthController.text.isEmpty;
    });

    if (_monthController.text.length == 2 && _monthFocusNode.hasFocus) {
      _dayFocusNode.requestFocus();
    }

    if (_monthController.text.isEmpty && _monthFocusNode.hasFocus) {
      _yearFocusNode.requestFocus();
    }
  }

  void _listenDay() {
    setState(() {
      isVisibleDayHint = _dayController.text.isEmpty;
    });

    if (_dayController.text.isEmpty && _dayFocusNode.hasFocus) {
      _monthFocusNode.requestFocus();
    }
  }

  void handleChanged(String _) {
    widget.onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    final isVisibleHint =
        isVisibleYearHint && isVisibleMonthHint && isVisibleDayHint;
    final slashTextColor =
        isVisibleHint
            ? context.textTheme.bodyLargeBold?.setSecondary
            : context.textTheme.bodyLargeBold?.setBlack;
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: ColorName.tertiary),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          IntrinsicWidth(
            child: HintEditableText(
              groupId: _groupId,
              hintText: 'YYYY',
              controller: _yearController,
              isVisibleHint: isVisibleYearHint,
              focusNode: _yearFocusNode,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(4),
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: handleChanged,
            ),
          ),
          const SizedBox(width: 10),
          Text("/", style: slashTextColor),
          const SizedBox(width: 10),
          IntrinsicWidth(
            child: HintEditableText(
              groupId: _groupId,
              hintText: 'MM',
              isVisibleHint: isVisibleMonthHint,
              controller: _monthController,
              focusNode: _monthFocusNode,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(2),
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: handleChanged,
            ),
          ),
          const SizedBox(width: 10),
          Text("/", style: slashTextColor),
          const SizedBox(width: 10),
          IntrinsicWidth(
            child: HintEditableText(
              groupId: _groupId,
              hintText: 'DD',
              isVisibleHint: isVisibleDayHint,
              controller: _dayController,
              focusNode: _dayFocusNode,
              keyboardType: TextInputType.number,
              inputFormatters: [
                LengthLimitingTextInputFormatter(2),
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: handleChanged,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
