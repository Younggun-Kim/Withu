import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/common/common.dart';
import 'package:withu/shared/shared.dart';

@RoutePage()
class ValidateBusinessPage extends StatelessWidget {
  const ValidateBusinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValidateBusinessBlocProvider(
      create: (context) => getIt(),
      child: _ValidateBusinessPageContent(),
    );
  }
}

class _ValidateBusinessPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValidateBusinessBlocBuilder(
      builder: (context, state) {
        return PageRoot(
          isLoading: state.status.isLoading,
          appBar: CustomAppBar.back(context: context),
          child: const SizedBox(),
        );
      },
    );
  }
}
