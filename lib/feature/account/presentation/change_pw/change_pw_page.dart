import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/domain/domain.dart';
import 'package:withu/feature/account/presentation/bloc/change_pw/change_pw_bloc.dart';
import 'package:withu/gen/assets.gen.dart';
import 'package:withu/shared/shared.dart';

import 'change_pw_page_args.dart';

@RoutePage()
class ChangePwPage extends StatelessWidget {
  final ChangePwPageArgs args;

  const ChangePwPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return ChangePwBlocProvider(
      create: (context) => getIt()..add(ChangePwArgsStored(args: args)),
      child: _ChangePwPageContent(),
    );
  }
}

class _ChangePwPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangePwBlocBuilder(
      builder: (context, state) {
        return PageRoot(
          isLoading: state.status.isLoading,
          appBar: CustomAppBar.back(context: context),
          padding: CustomEdgeInsets.horizontalPadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _FieldName.newPw(),
              _PasswordInput(),
              _PasswordDescription1(),
              _PasswordDescription2(),
              Spacer(),
              EnabledBtn(
                isEnabled: state.isEnabledFindPw,
                text: StringRes.login.tr,
                onTap: () {
                  context.read<ChangePwBloc>().add(ChangePwRequested());
                },
              ),
              const SizedBox(height: 55),
            ],
          ),
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
      margin: EdgeInsets.only(bottom: 11),
      child: Text(text, style: context.textTheme.bodyMediumBold),
    );
  }

  factory _FieldName.newPw() => _FieldName(text: '새 비밀번호');
}

class _PasswordInput extends StatefulWidget {
  const _PasswordInput();

  @override
  State<StatefulWidget> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<_PasswordInput> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller;
  }

  @override
  void dispose() {
    _controller;
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseInput(
      controller: _controller,
      focusNode: _focusNode,
      maxLength: 20,
      hintText: '비밀번호를 입력해주세요.',
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      obscureText: true,
      onChanged: (String text) {
        context.read<ChangePwBloc>().add(ChangePwInputted(value: text));
      },
    );
  }
}

class _PasswordDescription1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangePwBlocBuilder(
      builder: (context, state) {
        if (state.password.isValid()) {
          return const SizedBox();
        }
        return Container(
          margin: const EdgeInsets.only(top: 7),
          padding: EdgeInsets.symmetric(horizontal: 3),
          child: Row(
            children: [
              Assets.images.check.svg(),
              const SizedBox(width: 2),
              Text(
                '3개 이상 연속되거라 동일한 문자/숫자 제외',
                style: context.textTheme.bodySmall?.setPoint,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PasswordDescription2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangePwBlocBuilder(
      builder: (context, state) {
        if (state.password.isValid()) {
          return const SizedBox();
        }
        return Container(
          margin: const EdgeInsets.only(top: 7),
          padding: EdgeInsets.symmetric(horizontal: 3),
          child: Row(
            children: [
              Assets.images.check.svg(),
              const SizedBox(width: 2),
              Text(
                '영문/숫자 조합 (8 - 20자 이내)',
                style: context.textTheme.bodySmall?.setPoint,
              ),
            ],
          ),
        );
      },
    );
  }
}
