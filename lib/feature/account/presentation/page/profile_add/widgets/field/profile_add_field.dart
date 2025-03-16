import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/domain/type/field_type.dart';
import 'package:withu/feature/account/presentation/bloc/profile_add/profile_add_bloc.dart';
import 'package:withu/feature/account/presentation/bloc/profile_add/profile_add_step.dart';
import 'package:withu/feature/account/presentation/page/profile_add/widgets/layout/profile_add_layout2.dart';
import 'package:withu/gen/colors.gen.dart';

class ProfileAddField extends StatelessWidget {
  const ProfileAddField({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileAddLayout2(
      currentStep: ProfileAddStep.field,
      fillRemainingChild: _FieldContent(),
    );
  }
}

/// 전문 분야
class _FieldContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileAddBlocBuilder(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(top: 27),
          child: Column(
            children:
                FieldType.valuesWithoutNone
                    .map(
                      (field) => _FieldItem(
                        field: field,
                        isSelected: state.field == field,
                        onTap: () {
                          context.read<ProfileAddBloc>().add(
                            ProfileAddFieldSelected(field: field),
                          );
                        },
                      ),
                    )
                    .toList(),
          ),
        );
      },
    );
  }
}

class _FieldItem extends StatelessWidget {
  final FieldType field;

  final bool isSelected;

  final Function() onTap;

  const _FieldItem({
    required this.field,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isSelected ? ColorName.secondary : Colors.white;
    final textColor = isSelected ? Colors.white : ColorName.text;

    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Container(
        height: 50,
        margin: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorName.tertiary),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            field.toAsset()?.svg(
                  colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
                ) ??
                SizedBox(),
            const SizedBox(width: 10),
            SizedBox(
              width: 113,
              child: Text(
                field.toKor(),
                textAlign: TextAlign.center,
                style: context.textTheme.bodyMediumBold?.copyWith(
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
