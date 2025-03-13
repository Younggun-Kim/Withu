import 'package:flutter/material.dart';

class BoxShadowTheme {
  BoxShadowTheme();

  /// box-shadow: 0px 2px 8px 0px rgba(0, 0, 0, 0.10);
  List<BoxShadow> get md {
    return [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.1),
        spreadRadius: 0,
        blurRadius: 8,
        offset: const Offset(0, 2),
        blurStyle: BlurStyle.normal,
      ),
    ];
  }

  /// box-shadow: 0px 2px 8px 0px rgba(0, 0, 0, 0.25);
  List<BoxShadow> get mdBold {
    return [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.25),
        spreadRadius: 0,
        blurRadius: 8,
        offset: const Offset(0, 2),
        blurStyle: BlurStyle.normal,
      ),
    ];
  }

  /// box-shadow: 0px 2px 10px 0px rgba(0, 0, 0, 0.10);
  List<BoxShadow> get lg {
    return [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.1),
        spreadRadius: 0,
        blurRadius: 10,
        offset: const Offset(0, 2),
        blurStyle: BlurStyle.normal,
      ),
    ];
  }

  /// box-shadow: 0px 2px 10px 0px rgba(0, 0, 0, 0.25);
  List<BoxShadow> get lgBold {
    return [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.25),
        spreadRadius: 0,
        blurRadius: 10,
        offset: const Offset(0, 2),
        blurStyle: BlurStyle.normal,
      ),
    ];
  }
}
