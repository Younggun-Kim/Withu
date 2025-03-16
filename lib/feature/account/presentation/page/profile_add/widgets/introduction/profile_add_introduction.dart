import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/shared/widgets/lined_text_form/lined_text_form.dart';

import '../layout/profile_add_layout2.dart';

/// 자기소개 입력
class ProfileAddIntroduction extends StatefulWidget {
  const ProfileAddIntroduction({super.key});

  @override
  State<StatefulWidget> createState() => _IntroductionState();
}

class _IntroductionState extends State<ProfileAddIntroduction> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();

    /// 포커싱이 없으면 초기화 상태에서 값이 사라짐
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileAddBlocListener(
      listener: (context, state) {
        if (state.introduction.value != _controller.text) {
          _controller.text = state.introduction.value;
        }
      },
      child: ProfileAddLayout2(
        fillRemainingChild: Expanded(
          child: Container(
            alignment: Alignment.topCenter,
            child: LinedTextFormField(
              controller: _controller,
              focusNode: _focusNode,
              lineNum: 3,
              hint: StringRes.selfIntroInputHint.tr,
              onChanged: (String text) {
                context.read<ProfileAddBloc>().add(
                  ProfileAddIntroductionInputted(value: text),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileAddBlocBuilder(
      builder: (context, state) {
        final isCompany = getItGlobalBloc.state.isCompanyUser;
        return Text(
          state.currentStep.toTitle(isCompany),
          style: context.textTheme.headlineMedium?.setBlack,
        );
      },
    );
  }
}

class _Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileAddBlocBuilder(
      builder: (context, state) {
        final isCompany = getItGlobalBloc.state.isCompanyUser;
        return Text(
          state.currentStep.toDescription(isCompany),
          style: context.textTheme.bodyMedium?.setBlack,
        );
      },
    );
  }
}
