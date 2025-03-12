import 'dart:ui';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:withu/firebase_options.dart';

import 'fcm_utils.dart';

/// Firebase 초기화 클래스
class FirebaseInit {
  const FirebaseInit._();

  static Future init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    enabledAnalysis();
    await FirebaseInit.initCrashlytics();
    await FcmUtils.init();
  }

  static Future initCrashlytics() async {
    // Flutter 프레임워크 내에서 발생하는 모든 오류를 자동으로 포착할 수 있습니다.
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    // 비동기 오류 포착
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

    enabledCrashlytics();
  }

  static void enabledAnalysis() {
    FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  }

  static void enabledCrashlytics() {
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }
}
