import 'package:amplitude_flutter/amplitude.dart';
import 'package:amplitude_flutter/configuration.dart';
import 'package:withu/core/core.dart';

class AmplitudeUtils {
  static Future<void> init() async {
    final apiKey = DotEnvUtils.getAmplitudeKey();
    Amplitude(Configuration(apiKey: apiKey));
  }
}
