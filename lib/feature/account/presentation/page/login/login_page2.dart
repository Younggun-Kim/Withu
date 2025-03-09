import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:withu/core/core.dart';
import 'package:withu/core/router/router.gr.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/gen/assets.gen.dart';
import 'package:withu/gen/colors.gen.dart';
import 'package:withu/shared/shared.dart';

/// 로그인 화면
@RoutePage()
class LoginPage2 extends StatelessWidget {
  const LoginPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => getIt(),
      child: const LoginPage2Content(),
    );
  }
}

class LoginPage2Content extends StatefulWidget {
  const LoginPage2Content({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2Content> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) async {
        /// 로그인 성공
        if (state.status.isSuccess) {
          getItAppRouter.replaceAll([const JobPostingsRoute()]);
        }

        if (state.hasFailMessage) {
          await CustomAlertDialog.showContentAlert(
            context: context,
            content: state.message,
            closeCallback: () {
              context.read<LoginBloc>().add(LoginMessageCleared());
            },
          );
        }
      },
      builder: (context, state) {
        return PageRoot(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          isLoading: state.status.isLoading,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                Center(child: Assets.images.logo.svg(width: 215, height: 69)),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    StringRes.logoDescription.tr,
                    style: context.textTheme.bodyMediumBold,
                  ),
                ),
                const SizedBox(height: 130),
                _AppleBtn(),
                const SizedBox(height: 15),
                _GoogleBtn(),
                _Divider(),
                _EmailBtn(),
                const SizedBox(height: 44),
                _SignUpAndLoginBtn(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AppleBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        radius: 20,
        onTap: () async {
          // TODO: Apple Login & 회원가입 Flow
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

          logger.i(
            '\n${credential.authorizationCode}\n${credential.identityToken}\n',
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.apple.svg(width: 35, height: 35),
            const SizedBox(width: 10),
            Text(
              'Apple로 시작하기',
              style: context.textTheme.bodyLargeBold?.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GoogleBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        radius: 20,
        onTap: () async {
          // Trigger the authentication flow
          final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

          // Obtain the auth details from the request
          final GoogleSignInAuthentication? googleAuth =
              await googleUser?.authentication;

          // Create a new credential
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,
          );

          // Once signed in, return the UserCredential
          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.google.svg(width: 20, height: 20),
            const SizedBox(width: 10),
            Text(
              'Sign in with Google',
              style: context.textTheme.bodyLargeBold?.copyWith(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      margin: const EdgeInsets.symmetric(vertical: 35),
      color: ColorName.tertiary,
    );
  }
}

class _EmailBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseButton.basic(
      context: context,
      text: '이메일 로그인',
      onTap: () {
        context.router.push(EmailLoginRoute());
      },
    );
  }
}

class _SignUpAndLoginBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            context.router.push(TermRoute());
          },
          child: Text(
            '회원가입',
            style: context.textTheme.bodyMediumBold?.copyWith(
              color: ColorName.text,
            ),
          ),
        ),
        const SizedBox(width: 40),
        TextButton(
          onPressed: () {},
          child: Text(
            '아이디찾기',
            style: context.textTheme.bodyMediumBold?.copyWith(
              color: ColorName.text,
            ),
          ),
        ),
      ],
    );
  }
}
