import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/gen/assets.gen.dart';
import 'package:withu/shared/widgets/base_button/enabled_btn.dart';

class ProfileAddLayout3 extends StatelessWidget {
  final ProfileAddStep currentStep;
  final Widget? headerWidget;
  final Widget fillRemainingChild;

  const ProfileAddLayout3({
    super.key,
    required this.currentStep,
    required this.fillRemainingChild,
    this.headerWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileAddBlocBuilder(
      builder: (context, state) {
        final isCompany = getItGlobalBloc.state.isCompanyUser;

        return Padding(
          padding: CustomEdgeInsets.horizontalPadding(),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Assets.images.logoPuzzle.svg(),
                      const SizedBox(height: 11),
                      _Title(isCompany: isCompany, currentStep: currentStep),
                      const SizedBox(height: 14),
                      _Description(
                        isCompany: isCompany,
                        currentStep: currentStep,
                      ),
                      headerWidget ?? const SizedBox.shrink(),
                      const SizedBox(height: 20),
                      fillRemainingChild,
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              _SkipBtn(),
              const SizedBox(height: 20),
              _NextBtn(),
              const SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }
}

class _Title extends StatelessWidget {
  final bool isCompany;

  final ProfileAddStep currentStep;

  const _Title({required this.isCompany, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Text(
      currentStep.toTitle(isCompany),
      style: context.textTheme.headlineMedium?.setBlack,
    );
  }
}

class _Description extends StatelessWidget {
  final bool isCompany;

  final ProfileAddStep currentStep;

  const _Description({required this.isCompany, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Text(
      currentStep.toDescription(isCompany),
      style: context.textTheme.bodyMedium?.setBlack,
    );
  }
}

class _SkipBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          if (FocusScope.of(context).isFirstFocus) {
            FocusScope.of(context).unfocus();
            return;
          }
          context.read<ProfileAddBloc>().add(ProfileAddStepForwarded());
        },
        child: Text(
          StringRes.skipping.tr,
          style: context.textTheme.bodyMedium?.setBlack,
        ),
      ),
    );
  }
}

class _NextBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileAddBlocBuilder(
      builder: (context, state) {
        return EnabledBtn(
          isEnabled: state.isEnabledNextBtn(),
          text: StringRes.next.tr,
          onTap: () {
            if (FocusScope.of(context).isFirstFocus) {
              FocusScope.of(context).unfocus();
              return;
            }
            context.read<ProfileAddBloc>().add(ProfileAddStepForwarded());
          },
        );
      },
    );
  }
}
