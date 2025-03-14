import 'package:flutter/cupertino.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/presentation/bloc/profile_add/profile_add_bloc.dart';
import 'package:withu/feature/account/presentation/page/profile_add/widgets/layout/profile_add_layout.dart';
import 'package:withu/shared/dialogs/toast/toast.dart';
import 'package:withu/shared/widgets/base_button/base_button.dart';

class ProfileAddArea extends StatelessWidget {
  const ProfileAddArea({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileAddBlocListener(
      listener: (context, state) {},
      child: ProfileAddLayout(
        sliverWidget: _AreaAdd(),
        fillRemainingChild: SliverFillRemaining(
          child: Container(
            alignment: Alignment.topCenter,
            child: const SizedBox(),
          ),
        ),
      ),
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
                  if (state.isPortfolioFull) {
                    Toast.show(
                      context: context,
                      text: '지역은 최대 ${state.maxAreaCount}곳까지 추가가 가능합니다.',
                    );
                    return;
                  }

                  //TODO : 지역 호출
                },
              ),
              const SizedBox(width: 11),
              Text(
                '${state.portfolioImages.length}/${state.maxAreaCount}',
                style: context.textTheme.bodyMedium?.setBlack,
              ),
            ],
          ),
        );
      },
    );
  }
}
