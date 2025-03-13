import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:withu/shared/dialogs/toast/toast.dart';

class LaunchUrlUtils {
  static void openOutLink(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      Toast.showWithNavigatorKey(text: 'URL 주소를 확인해주세요.');
    }
  }
}
