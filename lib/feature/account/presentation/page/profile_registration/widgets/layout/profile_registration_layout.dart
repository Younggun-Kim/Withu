import 'package:flutter/material.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/gen/assets.gen.dart';

class ProfileRegistrationLayout extends StatelessWidget {
  final Widget? sliverWidget;

  final Widget fillRemainingChild;

  const ProfileRegistrationLayout({
    super.key,
    required this.fillRemainingChild,
    this.sliverWidget,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: CustomEdgeInsets.horizontalPadding(),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Assets.images.logoPuzzle.svg(),
                const SizedBox(height: 11),
                _Title(),
                const SizedBox(height: 14),
                _Description(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: CustomEdgeInsets.horizontalPadding(),
          sliver: SliverToBoxAdapter(child: sliverWidget ?? SizedBox.shrink()),
        ),
        SliverPadding(
          padding: CustomEdgeInsets.horizontalPadding(),
          sliver: fillRemainingChild,
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileRegistrationBlocBuilder(
      builder: (context, state) {
        return Text(
          state.currentStep.toTitle(),
          style: context.textTheme.headlineMedium?.setBlack,
        );
      },
    );
  }
}

class _Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileRegistrationBlocBuilder(
      builder: (context, state) {
        return Text(
          state.currentStep.toDescription(),
          style: context.textTheme.bodyMedium?.setBlack,
        );
      },
    );
  }
}
