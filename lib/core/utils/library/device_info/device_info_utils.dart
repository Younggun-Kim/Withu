import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

/// 디바이스 정보 관련 유틸
class DeviceInfoUtils {
  static Future<String> getDeviceName() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.model;
    } else {
      final iosInfo = await deviceInfo.iosInfo;
      return iosInfo.utsname.machine;
    }
  }
}
