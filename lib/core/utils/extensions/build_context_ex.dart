import 'package:flutter/cupertino.dart';

extension BuildContextEx on BuildContext {
  /// 키보드 내리기
  void keyboardUnfocus() {
    if (FocusScope.of(this).isFirstFocus) {
      FocusScope.of(this).unfocus();
    }
  }
}
