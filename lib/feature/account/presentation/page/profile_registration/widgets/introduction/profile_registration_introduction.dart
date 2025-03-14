import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/utils/resource/string_res.dart';
import 'package:withu/feature/account/presentation/bloc/profile_registration/profile_registration_bloc.dart';
import 'package:withu/feature/account/presentation/page/profile_registration/widgets/layout/profile_registration_layout.dart';
import 'package:withu/shared/widgets/lined_text_form/lined_text_form.dart';

/// 자기소개 입력
class ProfileRegistrationIntroduction extends StatefulWidget {
  const ProfileRegistrationIntroduction({super.key});

  @override
  State<StatefulWidget> createState() => _IntroductionState();
}

class _IntroductionState extends State<ProfileRegistrationIntroduction> {
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
    return ProfileRegistrationBlocListener(
      listener: (context, state) {
        if (state.introduction.value != _controller.text) {
          _controller.text = state.introduction.value;
        }
      },
      child: ProfileRegistrationLayout(
        fillRemainingChild: SliverFillRemaining(
          child: Container(
            alignment: Alignment.topCenter,
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
          ),
        ),
      ),
    );
  }
}
