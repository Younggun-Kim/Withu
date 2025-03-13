import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/account/domain/type/field_type.dart';
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
    return ProfileRegistrationBlocBuilder(
      builder: (context, state) {
        final pages = ProfileRegistrationStep.getValuesWith(
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
    ProfileRegistrationStep.introduction: _IntroductionContent(),
    ProfileRegistrationStep.field: _FieldContent(),
    ProfileRegistrationStep.portfolio: _PortfolioContent(),
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

class _PrevBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileRegistrationBlocBuilder(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(right: 10),
          child: BaseButton.basic(
            context: context,
            text: StringRes.prev.tr,
            onTap: () {
              context.read<ProfileRegistrationBloc>().add(
                ProfileRegistrationStepBackward(),
              );
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
    return ProfileRegistrationBlocBuilder(
      builder: (context, state) {
        return EnabledBtn(
          isEnabled: state.isEnabledNextBtn(),
          text: StringRes.next.tr,
          onTap: () {
            context.read<ProfileRegistrationBloc>().add(
              ProfileRegistrationStepForwarded(),
            );
          },
        );
      },
    );
  }
}

/// 자기소개 입력
class _IntroductionContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IntroductionContentContent();
}

class _IntroductionContentContent extends State<_IntroductionContent> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileRegistrationBlocConsumer(
      listener: (context, state) {
        if (state.introduction.value != _controller.text) {
          _controller.text = state.introduction.value;
        }
      },
      builder: (context, state) {
        return Container(
          alignment: Alignment.topCenter,
          padding: CustomEdgeInsets.horizontalPadding(),
          child: LinedTextFormField(
            controller: _controller,
            focusNode: _focusNode,
            lineNum: 3,
            hint: StringRes.selfIntroInputHint.tr,
            onChanged: (String text) {
              context.read<ProfileRegistrationBloc>().add(
                ProfileRegistrationIntroductionInputted(value: text),
              );
            },
          ),
        );
      },
    );
  }
}

/// 전문 분야
class _FieldContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileRegistrationBlocBuilder(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(top: 27),
          padding: CustomEdgeInsets.horizontalPadding(),
          child: Column(
            children:
                FieldType.valuesWithoutNone
                    .map(
                      (field) => _FieldItem(
                        field: field,
                        isSelected: state.field == field,
                        onTap: () {
                          context.read<ProfileRegistrationBloc>().add(
                            ProfileRegistrationFieldSelected(field: field),
                          );
                        },
                      ),
                    )
                    .toList(),
          ),
        );
      },
    );
  }
}

class _FieldItem extends StatelessWidget {
  final FieldType field;

  final bool isSelected;

  final Function() onTap;

  const _FieldItem({
    required this.field,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isSelected ? ColorName.secondary : Colors.white;
    final textColor = isSelected ? Colors.white : ColorName.text;

    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Container(
        height: 50,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorName.tertiary),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            field.toAsset()?.svg(
                  colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
                ) ??
                SizedBox(),
            const SizedBox(width: 10),
            SizedBox(
              width: 113,
              child: Text(
                field.toString(),
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMediumBold?.copyWith(
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 포트폴리오 추가하기
class _PortfolioContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileRegistrationBlocBuilder(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: CustomEdgeInsets.horizontalPadding(),
                child: Row(
                  children: [
                    BaseButton.fitSecondary(
                      context: context,
                      text: '사진 등록',
                      onTap: () async {
                        ImagePickerBottomSheet.show(
                          context: context,
                          onTap: (XFile file) {
                            context.read<ProfileRegistrationBloc>().add(
                              ProfileRegistrationAddPhotoRequested(file: file),
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(width: 11),
                    Text(
                      '${state.portfolioImages.length}/10',
                      style: context.textTheme.bodyMedium?.setBlack,
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)), // 간격 추가

            SliverPadding(
              padding: CustomEdgeInsets.horizontalPadding(),
              sliver: SliverGrid.builder(
                itemCount: state.portfolioImages.length,
                itemBuilder: (context, index) {
                  return _PortfolioImageItem(
                    imageFile: state.portfolioImages[index],
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 1.0,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _PortfolioImageItem extends StatelessWidget {
  final ImageFileValue imageFile;

  const _PortfolioImageItem({required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: ColorName.tertiary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.file(imageFile.toFile(), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: Container(
            decoration: BoxDecoration(
              color: ColorName.background,
              borderRadius: BorderRadius.circular(50),
            ),
            child: InkWell(
              onTap: () {
                context.read<ProfileRegistrationBloc>().add(
                  ProfileRegistrationPhotoDeleted(file: imageFile),
                );
              },
              child: Assets.images.close.svg(),
            ),
          ),
        ),
      ],
    );
  }
}
