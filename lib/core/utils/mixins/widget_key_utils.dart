import 'package:flutter/cupertino.dart';

mixin WidgetKeyUtils {
  String getKey();

  Key toKey() {
    return Key(getKey());
  }
}