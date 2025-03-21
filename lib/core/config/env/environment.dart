import 'package:flutter/foundation.dart';
import 'package:withu/core/core.dart';

class Environment {
  Environment._();

  static late final EnvironmentType env;

  /// Prod 환경 여부
  static bool get isProd => env == EnvironmentType.prod;

  // TODO: 테스트
  // static bool get isRelease => kDebugMode;
  static bool get isRelease => kReleaseMode;
}
