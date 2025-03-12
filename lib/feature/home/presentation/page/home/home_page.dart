import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/home/home.dart';
import 'package:withu/shared/shared.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        HomeBlocProvider(create: (context) => getIt()),
        ProfileBlocProvider(create: (context) => getIt()),
      ],
      child: HomeBlocBuilder(
        builder: (context, state) {
          return PageRoot(
            isLoading: false,
            bottomNavigationBar: CustomBottomNaviBar(
              currentIndex: state.currentPage.index,
              onTap: (int index) {
                context.read<HomeBloc>().add(
                  HomeBottomNaviPressed(index: index),
                );
              },
            ),
            child: IndexedStack(
              index: state.currentPage.index,
              children: [
                CalendarPage(),
                SearchPage(),
                JobPage(),
                ProfilePage(),
              ],
            ),
          );
        },
      ),
    );
  }
}
