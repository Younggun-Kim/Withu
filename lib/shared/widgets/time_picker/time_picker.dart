import 'package:flutter/cupertino.dart';
import 'package:withu/core/core.dart';

/// 타임 피커.
class TimePicker extends StatelessWidget {

  const TimePicker({super.key, required this.onDateTimeChanged});
  final Function(DateTime date) onDateTimeChanged;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CupertinoTheme(
          data: CupertinoThemeData(
            applyThemeToAll: true,
            textTheme: CupertinoTextThemeData(
              dateTimePickerTextStyle: context.textTheme.bodyMediumBold,
            ),
          ),
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time,
            use24hFormat: true,
            initialDateTime: DateTime.now().copyWith(hour: 0, minute: 0),
            onDateTimeChanged: onDateTimeChanged,
            selectionOverlayBuilder: (
              BuildContext context, {
              required int columnCount,
              required int selectedIndex,
            }) {
              return const SizedBox();
            },
          ),
        ),
        Center(child: Text(':', style: context.textTheme.bodyMediumBold)),
      ],
    );
  }
}
