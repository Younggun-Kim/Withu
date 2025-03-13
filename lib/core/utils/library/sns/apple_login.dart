import 'dart:async';

import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'sns_login.dart';

class AppleLogin implements SnsLogin {
  @override
  FutureOr<String> getCredential() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      webAuthenticationOptions: WebAuthenticationOptions(
        clientId: 'com.withu.conner',
        redirectUri: Uri.parse(
          'https://withu.staging.meetory.io/api/company/auth/apple/callback',
        ),
      ),
    );
    return credential.identityToken ?? '';
  }
}
