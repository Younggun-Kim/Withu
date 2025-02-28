import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart' show Mock;

class MockFirebaseCore extends Mock implements Firebase {}

class MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {});
}

void setUpFirebaseAnalytics() {
  setupFirebaseCoreMocks();
}
