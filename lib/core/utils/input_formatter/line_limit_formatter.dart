import 'package:flutter/services.dart';

/// 최대 줄 수를 제한하는 커스텀 InputFormatter
class LineLimitFormatter extends TextInputFormatter {
  final int maxLines;

  LineLimitFormatter(this.maxLines);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // 개행 문자('\n') 개수를 세서 maxLines 초과 시 입력을 막음
    int newLines = newValue.text.split('\n').length;
    if (newLines > maxLines) {
      return oldValue; // 기존 값 유지
    }
    return newValue; // 새로운 값 적용
  }
}
