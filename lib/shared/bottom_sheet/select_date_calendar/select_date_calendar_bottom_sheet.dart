import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:withu/core/core.dart';
import 'package:withu/gen/colors.gen.dart';

class SelectDateCalendarBottomSheet extends StatelessWidget {
  final DateTime initFocusDate;

  final Function(DateTime) onChanged;

  const SelectDateCalendarBottomSheet({
    super.key,
    required this.initFocusDate,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: CalendarDatePicker2(
        config: CalendarDatePicker2Config(
          calendarType: CalendarDatePicker2Type.single,
          calendarViewMode: CalendarDatePicker2Mode.day,
          hideMonthPickerDividers: true,
          disableMonthPicker: true,
          hideNextMonthIcon: true,
          hideLastMonthIcon: true,
          controlsTextStyle: context.textTheme.headlineLarge?.setBlack,
          weekdayLabelTextStyle: context.textTheme.bodyMedium,
          todayTextStyle: context.textTheme.bodyMedium?.setBlack,
          selectedDayHighlightColor: ColorName.primary,
          dayBuilder: ({
            required DateTime date,
            TextStyle? textStyle,
            BoxDecoration? decoration,
            bool? isSelected,
            bool? isDisabled,
            bool? isToday,
          }) {
            final isSunday = date.weekday == DateTime.sunday;
            final defaultTextColor = isSunday ? ColorName.red : ColorName.text;
            final selected = isSelected == true;
            final bgColor = selected ? ColorName.primary : Colors.transparent;
            final textColor =
                selected ? ColorName.background : defaultTextColor;
            return Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  '${date.day}',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: textColor,
                  ),
                ),
              ),
            );
          },
        ),
        value: [initFocusDate],
        displayedMonthDate: initFocusDate,
        onValueChanged: (dates) {
          if (dates.isNotEmpty == true) {
            onChanged(dates.first);

            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          }
        },
      ),
    );
  }

  /// 바텀 시트 보기.
  static Future show({
    required BuildContext context,
    required DateTime initFocusDate,
    required Function(DateTime) onChanged,
  }) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SelectDateCalendarBottomSheet(
          initFocusDate: initFocusDate,
          onChanged: onChanged,
        );
      },
    );
  }
}
