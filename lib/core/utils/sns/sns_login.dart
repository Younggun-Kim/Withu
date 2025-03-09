import 'dart:async';

abstract class SnsLogin {
  /// return: (String) - token
  FutureOr<String> getCredential();
}
