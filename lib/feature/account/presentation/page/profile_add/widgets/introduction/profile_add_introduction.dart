import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/account/presentation/page/profile_add/widgets/layout/profile_add_layout3.dart';
import 'package:withu/shared/widgets/lined_text_form/lined_text_form.dart';


/// 자기소개 입력
class ProfileAddIntroduction extends StatefulWidget {
  const ProfileAddIntroduction({super.key});

  @override
  State<StatefulWidget> createState() => _IntroductionState();
}

class _IntroductionState extends State<ProfileAddIntroduction>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _controller = TextEditingController();
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    // _controller = TextEditingController();
    _focusNode = FocusNode();
    logger.w(_controller.text);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _focusNode.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ProfileAddBlocListener(
      listener: (context, state) {
        if (state.introduction.value != _controller.text) {
          _controller.text = state.introduction.value;
        }
      },
      child: ProfileAddLayout3(
        currentStep: ProfileAddStep.introduction,
        fillRemainingChild: Container(
          alignment: Alignment.topCenter,
          child: LinedTextFormField(
            controller: _controller,
            focusNode: _focusNode,
            lineNum: 3,
            maxLength: 50,
            hint: StringRes.selfIntroInputHint.tr,
            onChanged: (String text) {
              context.read<ProfileAddBloc>().add(
                ProfileAddIntroductionInputted(value: text),
              );
            },
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
