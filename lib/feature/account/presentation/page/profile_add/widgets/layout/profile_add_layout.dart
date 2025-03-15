import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/gen/assets.gen.dart';
import 'package:withu/gen/colors.gen.dart';
import 'package:withu/shared/widgets/base_button/base_button.dart';
import 'package:withu/shared/widgets/base_button/enabled_btn.dart';

class ProfileAddLayout extends StatelessWidget {
  final Widget? sliverWidget;

  final Widget fillRemainingChild;

  const ProfileAddLayout({
    super.key,
    required this.fillRemainingChild,
    this.sliverWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileAddBlocBuilder(
      builder: (context, state) {
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
              sliver: SliverToBoxAdapter(
                child: sliverWidget ?? SizedBox.shrink(),
              ),
            ),
            SliverPadding(
              padding: CustomEdgeInsets.horizontalPadding(),
              sliver: fillRemainingChild,
            ),
            SliverPadding(
              padding: CustomEdgeInsets.horizontalPadding(),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    _SkipBtn(),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween, // 좌우 정렬을 적절히 배치
                      children: [
                        Visibility(
                          visible: !state.currentStep.isFirst,
                          child: Expanded(
                            flex: 1, // 이전 버튼의 크기 설정
                            child: _PrevBtn(),
                          ),
                        ),
                        Expanded(
                          flex: 2, // 다음 버튼이 더 넓게 차지하도록 설정
                          child: _NextBtn(),
                        ),
                      ],
                    ),

                    const SizedBox(height: 55),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileAddBlocBuilder(
      builder: (context, state) {
        final isCompany = getItGlobalBloc.state.isCompanyUser;
        return Text(
          state.currentStep.toTitle(isCompany),
          style: context.textTheme.headlineMedium?.setBlack,
        );
      },
    );
  }
}

class _Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileAddBlocBuilder(
      builder: (context, state) {
        final isCompany = getItGlobalBloc.state.isCompanyUser;
        return Text(
          state.currentStep.toDescription(isCompany),
          style: context.textTheme.bodyMedium?.setBlack,
        );
      },
    );
  }
}

class _SkipBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          context.read<ProfileAddBloc>().add(ProfileAddStepForwarded());
        },
        child: Text(
          StringRes.skipping.tr,
          style: context.textTheme.bodyMedium?.setBlack,
        ),
      ),
    );
  }
}

class _PrevBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileAddBlocBuilder(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(right: 10),
          child: BaseButton.basic(
            context: context,
            text: StringRes.prev.tr,
            textColor: ColorName.text,
            onTap: () {
              context.read<ProfileAddBloc>().add(ProfileAddStepBackward());
            },
          ),
        );
      },
    );
  }
}

class _NextBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileAddBlocBuilder(
      builder: (context, state) {
        return EnabledBtn(
          isEnabled: state.isEnabledNextBtn(),
          text: StringRes.next.tr,
          onTap: () {
            context.read<ProfileAddBloc>().add(ProfileAddStepForwarded());
          },
        );
      },
    );
  }
}
