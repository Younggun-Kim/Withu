import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: HomeBlocBuilder(
        builder: (context, state) {
          return PageRoot(
            isLoading: false,
            child: Center(
              child: InkWell(
                onTap: () {
                  context.read<HomeBloc>().add(HomeLogoutPressed());
                },
                child: Text('로그아웃', style: context.textTheme.headlineLarge),
              ),
            ),
          );
        },
      ),
    );
  }
}
