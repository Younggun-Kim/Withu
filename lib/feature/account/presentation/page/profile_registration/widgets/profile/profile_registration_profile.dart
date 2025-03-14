import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/presentation/bloc/profile_registration/profile_registration_bloc.dart';
import 'package:withu/feature/account/presentation/page/profile_registration/widgets/layout/profile_registration_layout.dart';
import 'package:withu/gen/assets.gen.dart';
import 'package:withu/shared/bottom_sheet/image_picker/image_picker_bottom_sheet.dart';

/// 프로필
class ProfileRegistrationProfile extends StatelessWidget {
  const ProfileRegistrationProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileRegistrationBlocBuilder(
      builder: (context, state) {
        return ProfileRegistrationLayout(
          fillRemainingChild: Center(
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                ImagePickerBottomSheet.show(
                  context: context,
                  onTap: (ImageFileValue image) {
                    context.read<ProfileRegistrationBloc>().add(
                      ProfileRegistrationProfilePhotoPressed(image: image),
                    );
                  },
                );
              },
              child: Stack(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                    ),
                    child: Image.file(
                      state.profileImage?.toFile() ?? File(''),
                      width: 170,
                      height: 170,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Assets.images.userDefault.svg(
                          width: 170,
                          height: 170,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 6,
                    right: 6,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: context.boxShadowTheme.md,
                      ),
                      padding: EdgeInsets.all(6),
                      child: Assets.images.pencil.svg(fit: BoxFit.contain),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
