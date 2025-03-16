import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/gen/assets.gen.dart';
import 'package:withu/gen/colors.gen.dart';

import '../widgets.dart';

part 'career_item.dart';

class ProfileAddCareer extends StatefulWidget {
  const ProfileAddCareer({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileAddCareerState();
}

class _ProfileAddCareerState extends State<ProfileAddCareer> {
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
    return ProfileAddBlocBuilder(
      builder: (context, state) {
        return ProfileAddLayout(
          sliverWidget: Column(
            children: [CareerFormWidget(), const SizedBox(height: 28)],
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
                  child: _CareerItem(
                    entity: entity,
                    onTap: () {
                      // TODO:  수정 버튼 클릭
                      // context.read<ProfileAddBloc>().add(
                      //   ProfileAddCareerSelected(entity: entity),
                      // );
                    },
                  ),
                ),
              );
            },
            itemCount: state.careers.length,
            onReorder: (int oldIndex, int newIndex) {
              context.read<ProfileAddBloc>().add(
                ProfileAddCareerReordered(
                  oldIndex: oldIndex,
                  newIndex: newIndex,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
