import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/utils/utils.dart';
import 'package:withu/feature/account/presentation/bloc/email_login/email_login_bloc.dart';
import 'package:withu/shared/shared.dart';

@RoutePage()
class EmailLoginPage extends StatelessWidget {
  const EmailLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EmailLoginBlocProvider(
      create: (context) => getIt(),
      child: _EmailLoginPageContent(),
    );
  }
}

class _EmailLoginPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EmailLoginBlocConsumer(
      listener: (context, state) {
        if (state.status.isSuccess) {
          Toast.show(context: context, text: '홈으로 이동할 예정');
        }
      },
      builder: (context, state) {
        return PageRoot(
          isLoading: state.status.isLoading,
          appBar: CustomAppBar.back(context: context),
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    _FieldName.email(),
                    _EmailInput(),
                    const SizedBox(height: 20),
                    _FieldName.password(),
                    _PasswordInput(),
                    const Spacer(),
                    _SubmitBtn(),
                    const SizedBox(height: 55),
                  ],
                ),
              ),
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

  factory _FieldName.email() => _FieldName(text: '이메일');

  factory _FieldName.password() => _FieldName(text: '비밀번호');
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
        context.read<EmailLoginBloc>().add(
          EmailLoginEmailInputted(value: text),
        );
      },
    );
  }
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
        context.read<EmailLoginBloc>().add(
          EmailLoginPasswordInputted(value: text),
        );
      },
    );
  }
}

class _SubmitBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EmailLoginBlocBuilder(
      builder: (context, state) {
        return EnabledBtn(
          text: StringRes.login.tr,
          isEnabled: state.isEnabledSubmit,
          onTap: () {
            context.read<EmailLoginBloc>().add(EmailLoginSubmitted());
          },
        );
      },
    );
  }
}
