import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:withu/core/core.dart';
import 'package:withu/core/router/router.gr.dart';
import 'package:withu/feature/account/presentation/page/term/term.dart';
import 'package:withu/gen/assets.gen.dart';
import 'package:withu/shared/shared.dart';

import '../find_account/find_account_page_args.dart';
import 'find_id_result_page_args.dart';

@RoutePage()
class FindIdResultPage extends StatelessWidget {
  final FindIdResultPageArgs args;

  const FindIdResultPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return PageRoot(
      isLoading: false,
      appBar: CustomAppBar.back(context: context),
      padding: CustomEdgeInsets.horizontalPadding(),
      child: args.isFound ? _FindSuccess(args: args) : _FindFailure(),
    );
  }
}

class _FindSuccess extends StatelessWidget {
  final FindIdResultPageArgs args;

  const _FindSuccess({required this.args});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(flex: 1, child: Container(height: double.infinity)),
        Assets.images.logoPuzzle.svg(width: 121),
        const SizedBox(height: 100),
        Text(
          '${args.name}님의 계정은',
          style: context.textTheme.headlineSmall?.setBlack,
        ),
        const SizedBox(height: 10),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: args.email,
                style: context.textTheme.headlineLarge,
              ),
              WidgetSpan(child: SizedBox(width: 8)),
              TextSpan(
                text: '입니다',
                style: context.textTheme.headlineSmall?.setBlack,
              ),
            ],
          ),
        ),
        Flexible(flex: 2, child: Container(height: double.infinity)),
        _MoveFindPwBtn(),
        const SizedBox(height: 20),
        BaseButton.enabled(
          context: context,
          text: '로그인',
          onTap: () {
            context.router.popUntilRoot();
          },
        ),
        const SizedBox(height: 55),
      ],
    );
  }
}

class _FindFailure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(flex: 1, child: const SizedBox.expand()),
        Assets.images.logoPuzzleSad.svg(),
        const SizedBox(height: 20),
        Text(
          '아직 계정이 없어요!\n회원가입을 해볼까요?',
          style: context.textTheme.headlineSmall?.setBlack,
        ),
        Flexible(flex: 2, child: const SizedBox.expand()),
        BaseButton.enabled(
          context: context,
          text: '회원가입',
          onTap: () {
            context.router.popAndPush(TermRoute(args: TermPageArgs.email()));
          },
        ),
        const SizedBox(height: 55),
      ],
    );
  }
}

class _MoveFindPwBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(
          FindAccountRoute(args: FindAccountPageArgs.password()),
        );
      },
      child: Text('비밀번호 찾기', style: context.textTheme.bodyMedium?.setBlack),
    );
  }
}
