import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/gen/colors.gen.dart';
import 'package:withu/shared/shared.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [SignUpBlocProvider(create: (context) => getIt())],
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
            appBar: CustomAppBar(),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 60, horizontal: 35),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _FieldName.name(),
                  NameInput(),
                  const SizedBox(height: 20),
                  _FieldName.birthDate(),
                  BirthDateInput(),
                  const SizedBox(height: 20),
                  _FieldName.gender(),
                  const SizedBox(height: 20),
                  TestBirthInput(),
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

class NameInput extends StatefulWidget {
  const NameInput({super.key});

  @override
  State<StatefulWidget> createState() => NameInputState();
}

class NameInputState extends State<NameInput> {
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
    );
  }
}

class BirthDateInput extends StatefulWidget {
  const BirthDateInput({super.key});

  @override
  State<StatefulWidget> createState() => BirthDateInputState();
}

class BirthDateInputState extends State<BirthDateInput> {
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
      hintText: 'YYYY/MM/DD',
    );
  }
}

class TestBirthInput extends StatefulWidget {
  const TestBirthInput({super.key});

  @override
  State<StatefulWidget> createState() => _TestBirthInputState();
}

class _TestBirthInputState extends State<TestBirthInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorName.tertiary),
      ),
      child: Row(
        children: [
          TextField(decoration: InputDecoration(hintText: 'YYYY')),
          Text(' / ', style: context.textTheme.bodyLarge?.setSecondary),
          TextField(decoration: InputDecoration(hintText: 'MM')),
          Text(' / ', style: context.textTheme.bodyLarge?.setSecondary),
          Expanded(
            child: TextField(decoration: InputDecoration(hintText: 'DD')),
          ),
        ],
      ),
    );
  }
}
