import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/common/common.dart';
import 'package:withu/gen/assets.gen.dart';
import 'package:withu/gen/colors.gen.dart';
import 'package:withu/shared/shared.dart';

/// @required 반드시 AreaBlocProvider를 최상단에 추가하세요.
class AreaBottomSheet extends StatelessWidget {
  const AreaBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return AreaBlocConsumer(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Header(),
                const SizedBox(height: 16),
                IndexedStack(
                  index: state.step.index,
                  children: [_Sido(), _Sgg()],
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        );
      },
    );
  }

  /// 바텀 시트 보기.
  static Future show({required BuildContext context}) async {
    final areaBloc = context.read<AreaBloc>(); // 미리 read 해서 저장

    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return BlocProvider.value(value: areaBloc, child: AreaBottomSheet());
      },
    );

    areaBloc.add(AreaReset());
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          child: Assets.images.chevronLeft.svg(),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Text(
            StringRes.selectHopeArea.tr,
            style: context.textTheme.bodyLargeBold?.setBlack,
          ),
        ),
      ],
    );
  }
}

class _Sido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AreaBlocBuilder(
      builder: (context, state) {
        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children:
              state.sidos
                  .map(
                    (sido) => IntrinsicWidth(
                      child: _AreaItem(
                        key: Key(sido.cd),
                        text: sido.addrName,
                        isSelected: sido.cd == state.selectedSido?.cd,
                        onTap: () {
                          context.read<AreaBloc>().add(
                            AreaSidoSelected(sido: sido),
                          );
                        },
                      ),
                    ),
                  )
                  .toList(),
        );
      },
    );
  }
}

class _Sgg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AreaBlocBuilder(
      builder: (context, state) {
        final bool isEnabled = state.selectedSgg != null;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children:
                  state.sgg
                      .map(
                        (sgg) => IntrinsicWidth(
                          child: _AreaItem(
                            key: Key(sgg.cd),
                            text: sgg.addrName,
                            isSelected: sgg.cd == state.selectedSgg?.cd,
                            onTap: () {
                              context.read<AreaBloc>().add(
                                AreaSggSelected(sgg: sgg),
                              );
                            },
                          ),
                        ),
                      )
                      .toList(),
            ),
            const SizedBox(height: 20),
            Center(
              child: InkWell(
                onTap: () {
                  if (!isEnabled) {
                    return;
                  }
                  context.read<AreaBloc>().add(AreaSubmitted());
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  width: 130,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isEnabled ? ColorName.secondary : ColorName.tertiary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    StringRes.next.tr,
                    style: context.textTheme.bodyLargeBold?.setWhite,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Emd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AreaBlocBuilder(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children:
                  state.emd
                      .map(
                        (emd) => IntrinsicWidth(
                          child: _AreaItem(
                            key: Key(emd.cd),
                            text: emd.addrName,
                            isSelected: emd.cd == state.selectedEmd?.cd,
                            onTap: () {
                              context.read<AreaBloc>().add(
                                AreaEmdSelected(emd: emd),
                              );
                            },
                          ),
                        ),
                      )
                      .toList(),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                context.read<AreaBloc>().add(AreaSubmitted());
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: Container(
                width: 130,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorName.secondary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  StringRes.next.tr,
                  style: context.textTheme.bodyLargeBold?.setWhite,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _AreaItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const _AreaItem({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SelectableFitBtn(text: text, isEnabled: isSelected, onTap: onTap);
  }
}
