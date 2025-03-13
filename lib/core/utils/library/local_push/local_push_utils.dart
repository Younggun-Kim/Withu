import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LocalPushUtils {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    final androidSetting = _initializeAndroid();
    final iosSetting = _initializeIOS();
    final setting = InitializationSettings(
      android: androidSetting,
      iOS: iosSetting,
    );
    await _plugin.initialize(setting);
  }

  /// Android 설정
  static AndroidInitializationSettings _initializeAndroid() {
    return AndroidInitializationSettings('@mipmap/launcher_icon');
  }

  /// iOS 설정
  static DarwinInitializationSettings _initializeIOS() {
    return DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );
  }

  /// 🔹 Firebase 메시지를 받아 로컬 알림 표시 (플랫폼별 코드 분리)
  static Future<void> showNotification(RemoteMessage message) async {
    await _plugin.show(
      0, // 알림 ID
      message.notification?.title ?? 'No Title',
      message.notification?.body ?? 'No Body',
      _getNotificationDetails(),
    );
  }

  /// 🔹 NotificationDetails 반환
  static NotificationDetails _getNotificationDetails() {
    return NotificationDetails(
      iOS: _getIOSDetails(),
      android: _getAOSDetails(),
    );
  }

  /// 🟢 Android용 NotificationDetails 설정
  static AndroidNotificationDetails _getAOSDetails() {
    return AndroidNotificationDetails(
      'Push Channel', // 채널 ID
      'Push Notifications', // 채널 이름
      channelDescription: 'This channel is used for important notifications.',
      importance: Importance.max,
      priority: Priority.high,
    );
  }

  /// 🟢 iOS용 NotificationDetails 설정
  static DarwinNotificationDetails _getIOSDetails() {
    return DarwinNotificationDetails(
      presentAlert: true, // 알림창 띄우기
      presentBadge: true, // 앱 배지 업데이트
      presentSound: true, // 소리 재생
    );
  }
}
