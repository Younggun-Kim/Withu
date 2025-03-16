import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/account/presentation/page/profile_add/widgets/widgets.dart';
import 'package:withu/feature/common/common.dart';
import 'package:withu/gen/colors.gen.dart';
import 'package:withu/shared/shared.dart';

import 'profile_add_page_args.dart';

@RoutePage()
class ProfileAddPage extends StatelessWidget {
  final ProfileAddPageArgs args;

  const ProfileAddPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        AreaBlocProvider(
          create: (context) => getIt<AreaBloc>()..add(AreaInitialized()),
        ),
        ProfileAddBlocProvider(
          create:
              (context) =>
                  getIt()..add(ProfileAddInitialized(entity: args.entity)),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          AreaBlocListener(
            listener: (context, state) {
              if (state.submitArea != null) {
                context.read<ProfileAddBloc>().add(
                  ProfileAddAreaAppend(area: state.submitArea!),
                );
              }
            },
          ),
        ],
        child: ProfileAddBlocBuilder(
          builder: (context, state) {
            return PageRoot(
              isLoading: state.status.isLoading,
              appBar: CustomAppBar.back(
                context: context,
                trailing: [_PageIndicator(), const SizedBox(width: 25)],
              ),
              child: _StepPageView(),
            );
          },
        ),
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
    ProfileAddStep.career: ProfileAddCareer(),
    ProfileAddStep.portfolio: ProfileAddPortfolio(),
    ProfileAddStep.area: ProfileAddArea(),
    ProfileAddStep.profile: ProfileAddProfile(),
  };

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(keepPage: true);
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
        final isCompany = getItGlobalBloc.state.isCompanyUser;
        final nextPage = state.currentStep.getIndexWith(isCompany);
        final currentPage = _pageController.page?.toInt();

        if (nextPage != currentPage) {
          _pageController.animateToPage(
            nextPage,
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
