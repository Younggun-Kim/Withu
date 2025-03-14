import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/feature/account/presentation/page/profile_registration/widgets/layout/profile_registration_layout.dart';
import 'package:withu/gen/assets.gen.dart';
import 'package:withu/gen/colors.gen.dart';
import 'package:withu/shared/widgets/base_button/icon_btn.dart';

import 'career_form_widget.dart';

part 'career_item.dart';

class ProfileRegistrationCareer extends StatefulWidget {
  const ProfileRegistrationCareer({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileRegistrationCareerState();
}

class _ProfileRegistrationCareerState extends State<ProfileRegistrationCareer> {
  late ValueKey<SliverReorderableListState> listStateKey;

  @override
  void initState() {
    super.initState();
    listStateKey = ValueKey(SliverReorderableListState());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileRegistrationBlocBuilder(
      builder: (context, state) {
        return ProfileRegistrationLayout(
          sliverWidget: Column(
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
              const SizedBox(height: 28),
            ],
          ),
          fillRemainingChild: SliverReorderableList(
            key: listStateKey,
            itemBuilder: (context, index) {
              final entity = state.careers[index];
              return Material(
                key: Key(entity.id),
                color: ColorName.background.withValues(alpha: 0.8),
                child: ReorderableDelayedDragStartListener(
                  index: index,
                  enabled: true,
                  child: _CareerItem(entity: entity),
                ),
              );
            },
            itemCount: state.careers.length,
            onReorder: (int oldIndex, int newIndex) {
              logger.i('$oldIndex - $newIndex');
            },
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
        context.read<ProfileRegistrationBloc>().add(
          ProfileRegistrationAddCareerPressed(),
        );
      },
    );
  }
}
