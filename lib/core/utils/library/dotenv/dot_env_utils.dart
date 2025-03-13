import 'package:flutter_dotenv/flutter_dotenv.dart';

enum DotEnvKeyType {
  amplitudeKey(key: 'AMPLITUDE_KEY');

  final String key;

  const DotEnvKeyType({required this.key});
}

class DotEnvUtils {
  static Future<void> init() async {
    await dotenv.load(fileName: ".env");
  }

  static String _getValue(DotEnvKeyType keyType) {
    return dotenv.env[keyType.key] ?? '';
  }

  static String getAmplitudeKey() {
    return _getValue(DotEnvKeyType.amplitudeKey);
  }
}
