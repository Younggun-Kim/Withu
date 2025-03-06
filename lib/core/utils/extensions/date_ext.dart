import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  /// 포맷팅한 날짜 얻기
  String format(String format) {
    final DateFormat formatter = DateFormat(format);
    return formatter.format(this);
  }
}

extension StringDateEx on String {
  DateTime? toDate(String format) {
    return DateFormat(format).tryParse(this);
  }

  bool isDateFormat(String format) {
    return toDate(format) != null;
  }
}
