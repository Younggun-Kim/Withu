import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/home/presentation/bloc/home/home_bloc.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            context.read<HomeBloc>().add(HomeLogoutPressed());
          },
          child: Text('로그아웃', style: context.textTheme.headlineLarge),
        ),
      ],
    );
  }
}
