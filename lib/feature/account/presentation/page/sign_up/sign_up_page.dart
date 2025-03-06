import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/shared/shared.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [SignUpBlocProvider(create: (context) => getIt())],
      child: _SignUpPageContent(),
    );
  }
}

class _SignUpPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SignUpBloc, SignUpState>(listener: (context, state) {}),
      ],
      child: SignUpBlocBuilder(
        builder: (context, state) {
          return PageRoot(
            isLoading: state.status.isLoading,
            appBar: CustomAppBar(),
            child: const SizedBox(),
          );
        },
      ),
    );
  }
}
