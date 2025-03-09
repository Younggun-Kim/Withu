import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:withu/core/core.dart';
import 'package:withu/gen/assets.gen.dart' show Assets;
import 'package:withu/gen/colors.gen.dart';
import 'package:withu/shared/shared.dart';

/// 회원가입 후 가이드 화면
@RoutePage()
class GuidePage extends StatelessWidget {
  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GuidePageContent();
  }
}

class GuidePageContent extends StatefulWidget {
  const GuidePageContent({super.key});

  @override
  State<StatefulWidget> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePageContent> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();

    _controller = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageRoot(
      isLoading: false,
      appBar: CustomAppBar.back(
        context: context,
        trailing: [
          _SkipBtn(
            onTap: () {
              if (_controller.page == 3) {
                return;
              }
              _controller.animateToPage(
                3,
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear,
              );
            },
          ),
          const SizedBox(width: 24),
        ],
      ),
      child: PageView(
        controller: _controller,
        children: [_Profile(), _Job(), _Schedule(), _Login()],
      ),
    );
  }
}

class _SkipBtn extends StatelessWidget {
  final VoidCallback onTap;

  const _SkipBtn({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Text('건너뛰기', style: context.textTheme.bodyLarge?.setBlack),
    );
  }
}

class _Title extends StatelessWidget {
  final String text;

  const _Title({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: context.textTheme.headlineMedium?.setBlack);
  }

  factory _Title.profile() {
    return _Title(text: '프로필 완성으로 시작해요!');
  }

  factory _Title.job() {
    return _Title(text: '원하는 공고를 찾고, 간편하게 지원하세요!');
  }

  factory _Title.schedule() {
    return _Title(text: '지원 일정도 놓치지 마세요!');
  }

  factory _Title.login() {
    return _Title(text: '이제 연결과 기회의 시간이 왔어요!');
  }
}

class _Description extends StatelessWidget {
  final String text;

  const _Description({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: context.textTheme.bodyMedium?.setBlack,
    );
  }

  factory _Description.profile() {
    return _Description(text: '프로필을 충실히 작성할수록\n더 많은 기회를 얻게 됩니다.');
  }

  factory _Description.job() {
    return _Description(text: '더 편리한 지원 프로세스로\n시간과 노력을 절약하세요!');
  }

  factory _Description.schedule() {
    return _Description(
      text: '중요한 일정이나 결과를 실시간으로 확인하고,\n놓치는 공고 없이 커리어를 만들어가세요!',
    );
  }

  factory _Description.login() {
    return _Description(text: '당신에게 맞는 공고를 찾아, 새로운 시작을 열어보세요.');
  }
}

class _Dot extends StatelessWidget {
  final bool isCurrent;

  const _Dot({required this.isCurrent});

  Color get bgColor => isCurrent ? ColorName.primary : ColorName.tertiary;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int page;

  const _Dots({required this.page});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _Dot(isCurrent: page == 0),
        const SizedBox(width: 20),
        _Dot(isCurrent: page == 1),
        const SizedBox(width: 20),
        _Dot(isCurrent: page == 2),
      ],
    );
  }
}

class _Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 140),
        Assets.images.guide1.svg(),
        const SizedBox(height: 50),
        _Title.profile(),
        const SizedBox(height: 5),
        _Description.profile(),
        const Spacer(),
        _Dots(page: 0),
        const Spacer(),
      ],
    );
  }
}

class _Job extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 140),
        Assets.images.guide2.svg(),
        const SizedBox(height: 50),
        _Title.job(),
        const SizedBox(height: 5),
        _Description.job(),
        const Spacer(),
        _Dots(page: 1),
        const Spacer(),
      ],
    );
  }
}

class _Schedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 140),
        Assets.images.guide3.svg(),
        const SizedBox(height: 50),
        _Title.schedule(),
        const SizedBox(height: 5),
        _Description.schedule(),
        const Spacer(),
        _Dots(page: 2),
        const Spacer(),
      ],
    );
  }
}

class _Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 140),
        Assets.images.guide4.svg(),
        const SizedBox(height: 50),
        _Title.login(),
        const SizedBox(height: 5),
        _Description.login(),

        const Spacer(),
        InkWell(
          child: Text('프로필 등록', style: context.textTheme.bodyMedium?.setBlack),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: BaseButton.enabled(
            context: context,
            text: '지금 바로 시작',
            onTap: () {},
          ),
        ),

        const Spacer(),
      ],
    );
  }
}
