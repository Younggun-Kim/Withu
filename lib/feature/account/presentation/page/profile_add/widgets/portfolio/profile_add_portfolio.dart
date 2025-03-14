import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/gen/assets.gen.dart';
import 'package:withu/gen/colors.gen.dart';
import 'package:withu/shared/bottom_sheet/image_picker/image_picker_bottom_sheet.dart';
import 'package:withu/shared/dialogs/dialogs.dart';
import 'package:withu/shared/widgets/base_button/base_button.dart';
import '../widgets.dart';

class ProfileAddPortfolio extends StatelessWidget {
  const ProfileAddPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileAddLayout(
      sliverWidget: _ImageAddBtnSliver(),
      fillRemainingChild: SliverFillRemaining(child: _PortfolioContent()),
    );
  }
}

class _ImageAddBtnSliver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileAddBlocBuilder(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Row(
            children: [
              BaseButton.fitSecondary(
                context: context,
                text: '사진 등록',
                onTap: () async {
                  if (state.isPortfolioFull) {
                    Toast.show(
                      context: context,
                      text: '이미지는 최대 ${state.maxImageCount}장까지 등록가능합니다.',
                    );
                    return;
                  }
                  ImagePickerBottomSheet.show(
                    context: context,
                    onTap: (ImageFileValue file) {
                      context.read<ProfileAddBloc>().add(
                        ProfileAddPhotoAddRequested(file: file),
                      );
                    },
                  );
                },
              ),
              const SizedBox(width: 11),
              Text(
                '${state.portfolioImages.length}/10',
                style: context.textTheme.bodyMedium?.setBlack,
              ),
            ],
          ),
        );
      },
    );
  }
}

/// 포트폴리오 추가하기
class _PortfolioContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileAddBlocBuilder(
      builder: (context, state) {
        return GridView.builder(
          itemCount: state.portfolioImages.length,
          itemBuilder: (context, index) {
            return _PortfolioImageItem(imageFile: state.portfolioImages[index]);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
            childAspectRatio: 1.0,
          ),
        );
      },
    );
  }
}

class _PortfolioImageItem extends StatelessWidget {
  final ImageFileValue imageFile;

  const _PortfolioImageItem({required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: ColorName.tertiary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.file(imageFile.toFile(), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: Container(
            decoration: BoxDecoration(
              color: ColorName.background,
              borderRadius: BorderRadius.circular(50),
            ),
            child: InkWell(
              onTap: () {
                context.read<ProfileAddBloc>().add(
                  ProfileAddPhotoDeleted(file: imageFile),
                );
              },
              child: Assets.images.close.svg(),
            ),
          ),
        ),
      ],
    );
  }
}
