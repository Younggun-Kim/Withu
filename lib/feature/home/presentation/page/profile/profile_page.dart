import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/home/presentation/bloc/profile/profile_bloc.dart';
import 'package:withu/gen/assets.gen.dart';
import 'package:withu/shared/shared.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalBlocListener(
      bloc: getItGlobalBloc,
      listener: (context, state) {
        logger.i(state.profileInfo);
        if (state.profileInfo?.userType != null) {
          context.read<ProfileBloc>().add(ProfileInitialized());
        }
      },
      child: ProfileBlocBuilder(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 28, horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                _CompanyProfile(),
                const Spacer(),
                _CompanyUnregistered(),
                const Spacer(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CompanyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Assets.images.userDefault.svg(),
        const SizedBox(width: 10),
        Text('회사 이름', style: context.textTheme.headlineLarge?.setBlack),
        const Spacer(),
        InkWell(onTap: () {}, radius: 30, child: Assets.images.menu.svg()),
      ],
    );
  }
}

class _CompanyUnregistered extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '아직 회사 정보가 없어요!',
          style: context.textTheme.bodyLargeBold?.setBlack,
        ),
        const SizedBox(height: 7),
        Text(
          '공고 등록, 스탭 관리 등 다양한 기능\n 더욱 편리하게 이용하실 수 있어요.',
          style: context.textTheme.bodyMedium?.setBlack,
        ),
        const SizedBox(height: 24),
        IntrinsicWidth(
          child: BaseButton.fitSecondary(
            context: context,
            text: '정보 등록하기',
            onTap: () {
              context.read<ProfileBloc>().add(ProfileRegistrationBtnPressed());
            },
          ),
        ),
      ],
    );
  }
}
