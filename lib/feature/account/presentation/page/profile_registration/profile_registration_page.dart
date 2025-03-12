import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/presentation/bloc/profile_registration/profile_registration_bloc.dart';
import 'package:withu/shared/shared.dart';

@RoutePage()
class ProfileRegistrationPage extends StatelessWidget {
  const ProfileRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileRegistrationBlocProvider(
      create: (context) => getIt(),

      child: ProfileRegistrationBlocBuilder(
        builder: (context, state) {
          return PageRoot(
            isLoading: state.status.isLoading,
            appBar: CustomAppBar.back(context: context),
            child: const SizedBox(),
          );
        },
      ),
    );
  }
}
