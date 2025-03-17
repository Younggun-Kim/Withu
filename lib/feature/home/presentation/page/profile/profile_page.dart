import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/home/presentation/bloc/profile/profile_bloc.dart';
import 'package:withu/gen/assets.gen.dart';
import 'package:withu/gen/colors.gen.dart';
import 'package:withu/shared/shared.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalBlocListener(
      bloc: getItGlobalBloc,
      listener: (context, state) {
        if (state.profileInfo?.userType != null) {
          context.read<ProfileBloc>().add(ProfileInitialized());
        }
      },
      child: ProfileBlocBuilder(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: _CompanyProfile()),
                SliverVisibility(
                  visible: state.profile.isEmpty,
                  sliver: SliverFillRemaining(child: _CompanyUnregistered()),
                ),
                _RegistrationVisibility(
                  onlyStaff: false,
                  sliver: SliverToBoxAdapter(
                    child: _IntroductionText(
                      text: state.profile.introduction.value,
                    ),
                  ),
                ),
                _RegistrationVisibility(
                  onlyStaff: true,
                  sliver: SliverToBoxAdapter(child: _AreaContent()),
                ),
                _RegistrationVisibility(
                  onlyStaff: true,
                  sliver: SliverToBoxAdapter(child: _CareerHeader()),
                ),
                _RegistrationVisibility(
                  onlyStaff: true,
                  sliver: SliverToBoxAdapter(child: _CareerContent()),
                ),
                _RegistrationVisibility(
                  onlyStaff: false,
                  sliver: SliverToBoxAdapter(child: _PortfolioContent()),
                ),
                _RegistrationVisibility(
                  onlyStaff: false,
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                    ),
                    delegate: SliverChildListDelegate(
                      state.profile.portfolioSubImageUrls
                          .map(
                            (imageUrl) => _PortfolioImage(imageUrl: imageUrl),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CompanyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileBlocBuilder(
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.network(
                state.profile.profileImageUrl.url,
                width: 55,
                height: 55,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stacktrace) {
                  return Assets.images.userDefault.svg();
                },
              ),
            ),
            const SizedBox(width: 10),
            Text(
              getItGlobalBloc.state.profileInfo?.name.value ?? '',
              style: context.textTheme.headlineLarge?.setBlack,
            ),
            const SizedBox(width: 7),
            FieldTag(field: state.profile.field),
            const Spacer(),
            InkWell(
              onTap: () {
                context.read<ProfileBloc>().add(
                  ProfileRegistrationBtnPressed(),
                );
              },
              radius: 30,
              child: Assets.images.menu.svg(),
            ),
          ],
        );
      },
    );
  }
}

class _CompanyUnregistered extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlobalBlocBuilder(
      bloc: getItGlobalBloc,
      builder: (context, state) {
        final isCompany = state.isCompanyUser;
        final title =
            isCompany
                ? StringRes.companyHasNoInfoTitle.tr
                : StringRes.staffHasNoInfoTitle.tr;
        final description =
            isCompany
                ? StringRes.companyHasNoInfoDescription.tr
                : StringRes.staffHasNoInfoDescription.tr;
        return Column(
          children: [
            const Spacer(),
            Text(title, style: context.textTheme.bodyLargeBold?.setBlack),
            const SizedBox(height: 7),
            Text(description, style: context.textTheme.bodyMedium?.setBlack),
            const SizedBox(height: 24),
            IntrinsicWidth(
              child: BaseButton.fitSecondary(
                context: context,
                text: StringRes.infoRegistration.tr,
                onTap: () {
                  context.read<ProfileBloc>().add(
                    ProfileRegistrationBtnPressed(),
                  );
                },
              ),
            ),
            const Spacer(),
          ],
        );
      },
    );
  }
}

class _FieldName extends StatelessWidget {
  final String text;

  const _FieldName({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Text(text, style: context.textTheme.bodyMediumBold?.setBlack),
    );
  }

  factory _FieldName.area() => _FieldName(text: StringRes.preferredLocation.tr);

  factory _FieldName.career() => _FieldName(text: StringRes.majorCareer.tr);

  factory _FieldName.portfolio() => _FieldName(text: StringRes.portfolio.tr);
}

class _RegistrationVisibility extends StatelessWidget {
  final bool onlyStaff;

  final Widget sliver;

  const _RegistrationVisibility({
    required this.onlyStaff,
    required this.sliver,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileBlocBuilder(
      builder: (context, state) {
        bool condition = !state.profile.isEmpty;

        if (onlyStaff) {
          condition = condition && !getItGlobalBloc.state.isCompanyUser;
        }

        return SliverVisibility(visible: condition, sliver: sliver);
      },
    );
  }
}

class _IntroductionText extends StatelessWidget {
  final String text;

  const _IntroductionText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 12, 0, 20),
      child: Text(text, style: context.textTheme.bodyMedium?.setBlack),
    );
  }
}

class _AreaTag extends StatelessWidget {
  final String area;

  const _AreaTag({required this.area});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 13),
      decoration: BoxDecoration(
        color: ColorName.tertiary,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(area, style: context.textTheme.bodySmallBold),
    );
  }
}

class _AreaContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileBlocBuilder(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _FieldName.area(),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children:
                  state.profile.areas
                      .map((area) => _AreaTag(area: area.fullAddr))
                      .toList(),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}

class _CareerItem extends StatelessWidget {
  final CareerEntity entity;

  const _CareerItem({required this.entity});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(entity.name.value, style: context.textTheme.bodyMedium?.setBlack),
        Text(
          entity.content.value,
          style: context.textTheme.bodySmall?.setBlack,
        ),
        Row(
          children: [
            Text(
              entity.startDate.value,
              style: context.textTheme.bodySmall?.setSecondary,
            ),
            const SizedBox(width: 15),
            Text(
              entity.companyName.value,
              style: context.textTheme.bodySmall?.setSecondary,
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

class _CareerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileBlocBuilder(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_FieldName.career()],
        );
      },
    );
  }
}

class _CareerContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CareerContentState();
}

class _CareerContentState extends State<_CareerContent> {
  final PageController _pageController = PageController();
  int _currentPage = 0; // 초기값 설정

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.hasClients) {
        setState(() {
          _currentPage = _pageController.page?.toInt() ?? 0;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileBlocBuilder(
      builder: (context, state) {
        final careers = state.profile.careers;
        final double height = 20 + (min(3, careers.length) * 80);
        final totalPage = (careers.length / 3).ceil();

        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: height,
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: totalPage,
                  itemBuilder: (context, pageIndex) {
                    final items = careers;
                    int startIndex = pageIndex * 3;
                    int endIndex = (startIndex + 3).clamp(0, items.length);
                    List<CareerEntity> pageItems = items.sublist(
                      startIndex,
                      endIndex,
                    );
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:
                          pageItems
                              .map((item) => _CareerItem(entity: item))
                              .toList(),
                    );
                  },
                ),
              ),
              _Dots(totalPage: totalPage, currentPage: _currentPage),
            ],
          ),
        );
      },
    );
  }
}

class _Dot extends StatelessWidget {
  final bool isCurrent;

  const _Dot({required this.isCurrent});

  Color get bgColor => isCurrent ? ColorName.text : ColorName.tertiary;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalPage;
  final int currentPage;

  const _Dots({required this.totalPage, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          List.generate(
            totalPage,
            (index) => index,
          ).map((index) => _Dot(isCurrent: index == currentPage)).toList(),
    );
  }
}

class _PortfolioImage extends StatelessWidget {
  final String imageUrl;

  const _PortfolioImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stacktrace) {
            return Container(
              width: double.infinity,
              height: double.infinity,
              color: ColorName.tertiary,
            );
          },
        ),
      ),
    );
  }
}

class _PortfolioContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileBlocBuilder(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _FieldName.portfolio(),
            Visibility(
              visible: state.profile.firstPortfolioImageUrl.isNotEmpty,
              child: _PortfolioImage(
                imageUrl: state.profile.firstPortfolioImageUrl,
              ),
            ),
            const SizedBox(height: 14),
          ],
        );
      },
    );
  }
}
