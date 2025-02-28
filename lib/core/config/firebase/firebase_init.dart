import 'package:firebase_core/firebase_core.dart';
import 'package:withu/firebase_options.dart';

/// Firebase 초기화 클래스
class FirebaseInit {
  const FirebaseInit._();

  static Future init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
