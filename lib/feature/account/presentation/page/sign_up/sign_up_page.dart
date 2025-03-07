import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/common/presentation/bloc/bloc.dart'
    show PhoneAuthBlocProvider;
import 'package:withu/feature/common/presentation/widget/phone_auth/phone_auth_widget.dart';
import 'package:withu/gen/colors.gen.dart';
import 'package:withu/shared/shared.dart';
import 'package:withu/shared/widgets/multi_input/ymd_input.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        PhoneAuthBlocProvider(create: (context) => getIt()),
        SignUpBlocProvider(create: (context) => getIt()),
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
        BlocListener<SignUpBloc, SignUpState>(listener: (context, state) {}),
      ],
      child: SignUpBlocBuilder(
        builder: (context, state) {
          return PageRoot(
            isLoading: state.status.isLoading,
            appBar: CustomAppBar.back(context: context),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 60, horizontal: 35),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
