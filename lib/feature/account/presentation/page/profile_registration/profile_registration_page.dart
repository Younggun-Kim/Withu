import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/gen/assets.gen.dart';
import 'package:withu/gen/colors.gen.dart';
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
            appBar: CustomAppBar.back(
              context: context,
              trailing: [_PageIndicator(), const SizedBox(width: 25)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: CustomEdgeInsets.horizontalPadding(),
                  child: Assets.images.logoPuzzle.svg(),
                ),
                const SizedBox(height: 11),
                Padding(
                  padding: CustomEdgeInsets.horizontalPadding(),
                  child: _Title(),
                ),
                const SizedBox(height: 14),
                Padding(
                  padding: CustomEdgeInsets.horizontalPadding(),
                  child: _Description(),
                ),
                const SizedBox(height: 30),
                Expanded(child: _StepPageView()),
                const SizedBox(height: 20),
                Padding(
                  padding: CustomEdgeInsets.horizontalPadding(),
                  child: _SkipBtn(),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: CustomEdgeInsets.horizontalPadding(),
                  child: _NextBtn(),
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
    return ProfileRegistrationBlocBuilder(
      builder: (context, state) {
        final pages = ProfileRegistrationStep.getValuesWith(
          getIt<AccountType>().iSCompany,
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

class _StepPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StepPageViewState();
}

class _StepPageViewState extends State<_StepPageView> {
  final Map<ProfileRegistrationStep, Widget> pageMap = {
    ProfileRegistrationStep.introduction: Text('1'),
    ProfileRegistrationStep.field: Text('2'),
    ProfileRegistrationStep.portfolio: Text('3'),
    ProfileRegistrationStep.career: Text('4'),
    ProfileRegistrationStep.area: Text('5'),
    ProfileRegistrationStep.profile: Text('6'),
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
    return ProfileRegistrationBlocConsumer(
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
    return ProfileRegistrationStep.getValuesWith(
      getIt<AccountType>().iSCompany,
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
          context.read<ProfileRegistrationBloc>().add(
            ProfileRegistrationStepForwarded(),
          );
        },
        child: Text(
          StringRes.skipping.tr,
          style: context.textTheme.bodyMedium?.setBlack,
        ),
      ),
    );
  }
}

class _NextBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EnabledBtn(
      isEnabled: false,
      text: StringRes.next.tr,
      onTap: () {
        context.read<ProfileRegistrationBloc>().add(
          ProfileRegistrationStepForwarded(),
        );
      },
    );
  }
}
