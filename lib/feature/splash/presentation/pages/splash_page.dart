import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/splash/presentation/bloc/splash_bloc.dart';

/// Splash 화면.
@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (context) => getIt()..add(OnInitializeApp()),
      child: _SplashPage(),
    );
  }
}

class _SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (!state.nextPage.isNone) {
            context.router.replaceAll([state.nextPage.getRoute]);
          }
        },
        child: Center(
          child: Text(
            StringRes.appName.tr,
            style: context.textTheme.headlineLarge,
          ),
        ),
      ),
    );
  }
}
