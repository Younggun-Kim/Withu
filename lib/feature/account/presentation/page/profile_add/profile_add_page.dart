import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/account/presentation/page/profile_add/widgets/widgets.dart';
import 'package:withu/gen/colors.gen.dart';
import 'package:withu/shared/shared.dart';

@RoutePage()
class ProfileAddPage extends StatelessWidget {
  const ProfileAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileAddBlocProvider(
      create: (context) => getIt(),
      child: ProfileAddBlocBuilder(
        builder: (context, state) {
          return PageRoot(
            isLoading: state.status.isLoading,
            appBar: CustomAppBar.back(
              context: context,
              trailing: [_PageIndicator(), const SizedBox(width: 25)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _StepPageView()),
                const SizedBox(height: 20),
                Padding(
                  padding: CustomEdgeInsets.horizontalPadding(),
                  child: _SkipBtn(),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: CustomEdgeInsets.horizontalPadding(),
                  child: Row(
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
                ),

                const SizedBox(height: 55),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _IndicatorItem extends StatelessWidget {
  final bool isCurrent;

  const _IndicatorItem({required this.isCurrent});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: isCurrent ? ColorName.text : ColorName.tertiary,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileAddBlocBuilder(
      builder: (context, state) {
        final pages = ProfileAddStep.getValuesWith(
          getItGlobalBloc.state.isCompanyUser,
        );
        return Row(
          children: List.generate(
            pages.length,
            (index) =>
                _IndicatorItem(isCurrent: state.currentStep == pages[index]),
          ),
        );
      },
    );
  }
}

class _StepPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StepPageViewState();
}

class _StepPageViewState extends State<_StepPageView> {
  final Map<ProfileAddStep, Widget> pageMap = {
    ProfileAddStep.introduction: ProfileAddIntroduction(),
    ProfileAddStep.field: ProfileAddField(),
    ProfileAddStep.portfolio: ProfileAddPortfolio(),
    ProfileAddStep.career: ProfileAddCareer(),
    ProfileAddStep.area: Text('5'),
    ProfileAddStep.profile: ProfileAddProfile(),
  };

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileAddBlocConsumer(
      listener: (context, state) {
        if (state.currentStep.index != _pageController.page?.toInt()) {
          _pageController.animateToPage(
            state.currentStep.index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        }
      },
      builder: (context, state) {
        return PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: _getPages(),
        );
      },
    );
  }

  List<Widget> _getPages() {
    return ProfileAddStep.getValuesWith(
      getItGlobalBloc.state.isCompanyUser,
    ).map((type) => pageMap[type]).whereType<Widget>().toList();
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
