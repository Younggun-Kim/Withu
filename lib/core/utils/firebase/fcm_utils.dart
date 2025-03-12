import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:withu/core/utils/logger/logger.dart';

import '../local_push/local_push_utils.dart';

@pragma('vm:entry-point')
Future<void> _fcmBackgroundHandler(RemoteMessage message) async {
  logger.i("Handling a background message: ${message.messageId}");
}

class FcmUtils {
  static FutureOr<void> init() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    setForegroundMessage();
    setBackgroundMessage();
    enabledFcm();
    await getFcmToken();
    listenTokenRefresh();
  }

  static void enabledFcm() {
    FirebaseMessaging.instance.setAutoInitEnabled(true); // FCM 활성화
  }

  static void setForegroundMessage() {
    /// Foreground 설정
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      logger.i('FCM Foreground Message: $message');
      if (message == null) {
        return;
      }
      LocalPushUtils.showNotification(message);
    });
  }

  static void setBackgroundMessage() {
    /// Background
    FirebaseMessaging.onBackgroundMessage(_fcmBackgroundHandler);
  }

  static void listenTokenRefresh() {
    FirebaseMessaging.instance.onTokenRefresh.listen((String newToken) {
      // TODO: 로그인 여부 체크하고, User 정보에 따라 토큰 저장하는 API 가 필요
      logger.i("FCM Token Updated: $newToken");
    });
  }

  static FutureOr<String> getFcmToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken() ?? '';
    logger.i('🎂🎂🎂FCM TOKEN: $fcmToken');
    return fcmToken;
  }
}
