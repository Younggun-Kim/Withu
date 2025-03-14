import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/presentation/bloc/profile_add/profile_add_bloc.dart';
import 'package:withu/feature/account/presentation/page/profile_add/widgets/layout/profile_add_layout.dart';
import 'package:withu/feature/common/common.dart';
import 'package:withu/gen/assets.gen.dart';
import 'package:withu/gen/colors.gen.dart';
import 'package:withu/shared/bottom_sheet/area/area_bottom_sheet.dart';
import 'package:withu/shared/dialogs/toast/toast.dart';
import 'package:withu/shared/widgets/base_button/base_button.dart';

class ProfileAddArea extends StatelessWidget {
  const ProfileAddArea({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileAddBlocBuilder(
      builder: (context, state) {
        return ProfileAddLayout(
          sliverWidget: _AreaAdd(),
          fillRemainingChild: SliverFillRemaining(
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children:
                  state.areas.map((area) => _AreaWrapItem(area: area)).toList(),
            ),
          ),
        );
      },
    );
  }
}

class _AreaAdd extends StatelessWidget {
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
                text: '지역 추가',
                onTap: () async {
                  if (state.isAreaFull) {
                    Toast.show(
                      context: context,
                      text: '지역은 최대 ${state.maxAreaCount}곳까지 추가가 가능합니다.',
                    );
                    return;
                  }

                  await AreaBottomSheet.show(context: context);
                },
              ),
              const SizedBox(width: 11),
              Text(
                '${state.areas.length}/${state.maxAreaCount}',
                style: context.textTheme.bodyMedium?.setBlack,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _AreaWrapItem extends StatelessWidget {
  final AreaEntity area;

  const _AreaWrapItem({required this.area});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.5, horizontal: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: ColorName.tertiary),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(area.fullAddr, style: context.textTheme.bodySmallBold),
          const SizedBox(width: 5),
          InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              context.read<ProfileAddBloc>().add(
                ProfileAddAreaDeleted(area: area),
              );
            },
            child: Assets.images.close.svg(
              width: 14,
              height: 14,
              colorFilter: ColorFilter.mode(ColorName.primary, BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}
