import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:withu/shared/dialogs/dialogs.dart';

class OutLink {
  static void openUrl(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      Toast.showWithNavigatorKey(text: 'URL 주소를 확인해주세요.');
    }
  }
}
