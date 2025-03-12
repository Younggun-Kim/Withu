import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/home/presentation/bloc/home/home_bloc.dart';
import 'package:withu/shared/shared.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeBlocProvider(
      create: (context) => getIt(),
      child: PageRoot(
        isLoading: false,
        child: Center(
          child: Text('홈 화면', style: context.textTheme.headlineLarge),
        ),
      ),
    );
  }
}
