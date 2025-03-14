import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/account/presentation/page/profile_registration/widgets/layout/profile_registration_layout.dart';
import 'package:withu/gen/assets.gen.dart';
import 'package:withu/gen/colors.gen.dart';
import 'package:withu/shared/widgets/base_button/icon_btn.dart';

import 'career_form_widget.dart';

class ProfileRegistrationCareer extends StatelessWidget {
  const ProfileRegistrationCareer({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileRegistrationBlocBuilder(
      builder: (context, state) {
        return ProfileRegistrationLayout(
          fillRemainingChild: Column(
            children: [
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child:
                    state.hasNewCareer
                        ? CareerFormWidget()
                        : const SizedBox(width: double.infinity, height: 0),
              ),
              _CareerAddBtn(),
              const SizedBox(height: 40),
            ],
          ),
        );
      },
    );
  }
}

class _CareerAddBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconBtn(
      text: StringRes.addCareer.tr,
      backgroundColor: ColorName.background,
      icon: Assets.images.plusSm.svg(
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ),
      onTap: () {
        logger.i('click');
        context.read<ProfileRegistrationBloc>().add(
          ProfileRegistrationAddCareerPressed(),
        );
      },
    );
  }
}
