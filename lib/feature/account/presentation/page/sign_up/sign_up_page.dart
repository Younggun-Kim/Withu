import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/core/router/router.gr.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/common/common.dart';
import 'package:withu/gen/assets.gen.dart';
import 'package:withu/gen/colors.gen.dart';
import 'package:withu/shared/shared.dart';
import 'package:withu/shared/widgets/multi_input/ymd_input.dart';

import 'sign_up_page_args.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  final SignUpPageArgs args;
  const SignUpPage({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        PhoneAuthBlocProvider(
          create:
              (context) => getIt<PhoneAuthBloc>()..add(PhoneAuthInitialized()),
        ),
        SignUpBlocProvider(
          create: (context) => getIt()..add(SignUpArgsStored(value: args)),
        ),
      ],
      child: _SignUpPageContent(),
    );
  }
}

class _SignUpPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        SignUpBlocListener(
          listener: (context, state) {
            if (state.status.isSuccess) {
              context.router.push(GuideRoute());
            }
          },
        ),
        PhoneAuthBlocListener(
          listener: (context, state) {
            if (state.status.isLoading) {
              context.read<SignUpBloc>().add(SignUpRequestSent());
            } else {
              context.read<SignUpBloc>().add(SignUpRequestCompleted());
            }

            /// 휴대폰 번호 전달
            context.read<SignUpBloc>().add(
              SignUpPhoneNumInputted(value: state.phone),
            );

            /// 인증 완료 여부 전달
            context.read<SignUpBloc>().add(
              SignUpPhoneVerifyChanged(value: state.verifyState.isSuccess),
            );
          },
        ),
      ],
      child: SignUpBlocBuilder(
        builder: (context, state) {
          return PageRoot(
            isLoading: state.status.isLoading,
            appBar: CustomAppBar.back(context: context),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _FieldName.name(),
                  _NameInput(),
                  const SizedBox(height: 20),
                  _FieldName.birthDate(),
                  _BirthDateInput(),
                  const SizedBox(height: 20),
                  _FieldName.gender(),
                  _GenderBtnRow(),
                  const SizedBox(height: 20),
                  _FieldName.email(),
                  _EmailInput(),
                  const SizedBox(height: 20),
                  _FieldName.phone(),
                  PhoneAuthWidget(),
                  const SizedBox(height: 20),
                  _FieldName.password(),
                  _PasswordInput(),
                  _PasswordDescription1(),
                  _PasswordDescription2(),
                  const SizedBox(height: 20),
                  _FieldName.channel(),
                  const SizedBox(height: 11),
                  _ChannelBtn(),
                  const SizedBox(height: 11),
                  _ReferrerUserInput(),
                  const SizedBox(height: 20),
                  _SubmitBtn(),
                  const SizedBox(height: 40),
                ],
              ),
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

  factory _FieldName.birthDate() => _FieldName(text: '생년월일');

  factory _FieldName.gender() => _FieldName(text: '성별');

  factory _FieldName.email() => _FieldName(text: '이메일');

  factory _FieldName.phone() => _FieldName(text: '휴대폰 번호');

  factory _FieldName.password() => _FieldName(text: '비밀번호');

  factory _FieldName.channel() => _FieldName(text: '앱 유입경로');
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
      textInputAction: TextInputAction.next,
      onChanged: (String text) {
        context.read<SignUpBloc>().add(SignUpNameInputted(value: text));
      },
    );
  }
}

class _BirthDateInput extends StatelessWidget {
  const _BirthDateInput();

  @override
  Widget build(BuildContext context) {
    return YmdInput(
      onChanged: (String text) {
        context.read<SignUpBloc>().add(
          SignUpBirthDateInputted(value: BirthDateValue(text)),
        );
      },
    );
  }
}

class _GenderBtn extends StatelessWidget {
  final bool isSelected;

  final GenderType gender;

  final Function(GenderType) onTap;

  const _GenderBtn({
    required this.isSelected,
    required this.gender,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final svgColor = isSelected ? ColorName.background : ColorName.primary;
    return SelectableIconBtn(
      icon:
          gender.toSvg()?.svg(
            colorFilter: ColorFilter.mode(svgColor, BlendMode.srcIn),
          ) ??
          const SizedBox(),
      text: gender.toString(),
      isSelected: isSelected,
      onTap: () => onTap(gender),
    );
  }
}

class _GenderBtnRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignUpBlocBuilder(
      builder: (context, state) {
        void handleSelected(GenderType gender) {
          context.read<SignUpBloc>().add(SignUpGenderSelected(value: gender));
        }

        return Row(
          children: [
            Expanded(
              child: _GenderBtn(
                isSelected: state.gender.isFemale,
                gender: GenderType.female,
                onTap: handleSelected,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _GenderBtn(
                isSelected: state.gender.isMale,
                gender: GenderType.male,
                onTap: handleSelected,
              ),
            ),
          ],
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
        context.read<SignUpBloc>().add(
          SignUpEmailInputted(value: EmailValue(text)),
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
        context.read<SignUpBloc>().add(SignUpPasswordInputted(value: text));
      },
    );
  }
}

class _PasswordDescription1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignUpBlocBuilder(
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
    return SignUpBlocBuilder(
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

class _ChannelBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignUpBlocBuilder(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            ListDialog.channels(
              context: context,
              selectedType: state.channel,
              onPressed: (ChannelType value) {
                context.read<SignUpBloc>().add(
                  SignUpChannelSelected(value: value),
                );
              },
            );
          },
          radius: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: ColorName.tertiary),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(state.channelText, style: context.textTheme.bodyLarge),
                const Spacer(),
                Assets.images.chevronDown.svg(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ReferrerUserInput extends StatefulWidget {
  const _ReferrerUserInput();

  @override
  State<StatefulWidget> createState() => _ReferrerUserInputState();
}

class _ReferrerUserInputState extends State<_ReferrerUserInput> {
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
      hintText: '추천인 아이디가 있나요? (선택)',
      textInputAction: TextInputAction.done,
      onChanged: (String text) {
        context.read<SignUpBloc>().add(SignUpReferrerUserInputted(value: text));
      },
    );
  }
}

class _SubmitBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignUpBlocBuilder(
      builder: (context, state) {
        return EnabledBtn(
          text: StringRes.next.tr,
          isEnabled: state.isEnabledSubmitBtn,
          onTap: () {
            context.read<SignUpBloc>().add(SignUpRequested());
          },
        );
      },
    );
  }
}
