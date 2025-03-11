import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/presentation/bloc/find_account/find_account_bloc.dart';
import 'package:withu/feature/common/common.dart';
import 'package:withu/shared/shared.dart';

import 'find_account_page_args.dart';

@RoutePage()
class FindAccountPage extends StatelessWidget {
  final FindAccountPageArgs args;

  const FindAccountPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        FindAccountBlocProvider(
          create:
              (context) =>
                  getIt()..add(FindAccountPageTypeChanged(type: args.pageType)),
        ),
        PhoneAuthBlocProvider(
          create:
              (context) => getIt<PhoneAuthBloc>()..add(PhoneAuthInitialized()),
        ),
      ],
      child: _FindAccountPageContent(),
    );
  }
}

class _FindAccountPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        PhoneAuthBlocListener(
          listener: (context, state) {
            if (state.status.isLoading) {
              context.read<FindAccountBloc>().add(FindAccountLoadingOn());
            } else {
              context.read<FindAccountBloc>().add(FindAccountLoadingOff());
            }

            /// 휴대폰 번호 전달
            context.read<FindAccountBloc>().add(
              FindAccountPhoneNumInputted(value: state.phone),
            );

            /// 인증 완료 여부 전달
            context.read<FindAccountBloc>().add(
              FindAccountPhoneVerifyChanged(value: state.verifyState.isSuccess),
            );
          },
        ),
        FindAccountBlocListener(listener: (context, state) {}),
      ],
      child: FindAccountBlocBuilder(
        builder: (context, state) {
          return PageRoot(
            isLoading: state.status.isLoading,
            appBar: CustomAppBar.back(context: context),
            padding: CustomEdgeInsets.horizontalPadding(),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      _FieldName.name(),
                      _NameInput(),
                      const SizedBox(height: 20),
                      if (state.pageType.isPw) _FieldName.email(),
                      if (state.pageType.isPw) _EmailInput(),
                      if (state.pageType.isPw) const SizedBox(height: 20),
                      _FieldName.phone(),
                      PhoneAuthWidget(),
                      const Spacer(),
                      _MoveFindPwBtn(),
                      _MoveFindIdBtn(),
                      _FindIdBtn(),
                      _FindPwBtn(),
                      const SizedBox(height: 55),
                    ],
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

  factory _FieldName.name() => _FieldName(text: '이름');

  factory _FieldName.phone() => _FieldName(text: '휴대폰');

  factory _FieldName.email() => _FieldName(text: '이메일');
}

class _NameInput extends StatefulWidget {
  const _NameInput();

  @override
  State<StatefulWidget> createState() => _NameInputState();
}

class _NameInputState extends State<_NameInput> {
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
      hintText: '홍길동',
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: (String text) {
        context.read<FindAccountBloc>().add(
          FindAccountNameInputted(value: text),
        );
      },
    );
  }
}

class _EmailInput extends StatefulWidget {
  const _EmailInput();

  @override
  State<StatefulWidget> createState() => _EmailInputState();
}

class _EmailInputState extends State<_EmailInput> {
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
      hintText: '이메일을 입력해주세요.',
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: (String text) {
        context.read<FindAccountBloc>().add(
          FindAccountEmailInputted(value: text),
        );
      },
    );
  }
}

class _MoveFindPwBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FindAccountBlocBuilder(
      builder: (context, state) {
        if (state.pageType.isPw) {
          return const SizedBox();
        }
        return Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(bottom: 20),
          child: InkWell(
            onTap: () {
              context.read<FindAccountBloc>().add(
                FindAccountPageTypeChanged(type: FindAccountPageType.password),
              );
            },
            child: Text(
              '비밀번호 찾기',
              style: context.textTheme.bodyMedium?.setBlack,
            ),
          ),
        );
      },
    );
  }
}

class _MoveFindIdBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FindAccountBlocBuilder(
      builder: (context, state) {
        if (state.pageType.isId) {
          return const SizedBox();
        }
        return Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(bottom: 20),
          child: InkWell(
            onTap: () {
              context.read<FindAccountBloc>().add(
                FindAccountPageTypeChanged(type: FindAccountPageType.id),
              );
            },
            child: Text(
              '아이디 찾기',
              style: context.textTheme.bodyMedium?.setBlack,
            ),
          ),
        );
      },
    );
  }
}

class _FindIdBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FindAccountBlocBuilder(
      builder: (context, state) {
        if (state.pageType.isPw) {
          return const SizedBox();
        }
        return EnabledBtn(
          text: '아이디 찾기',
          isEnabled: state.isEnabledFindId,
          onTap: () {
            context.read<FindAccountBloc>().add(FindAccountFindIdPressed());
          },
        );
      },
    );
  }
}

class _FindPwBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FindAccountBlocBuilder(
      builder: (context, state) {
        if (state.pageType.isId) {
          return const SizedBox();
        }
        return EnabledBtn(
          text: '비밀번호 찾기',
          isEnabled: state.isEnabledFindId,
          onTap: () {
            context.read<FindAccountBloc>().add(
              FindAccountFindPasswordPressed(),
            );
          },
        );
      },
    );
  }
}
