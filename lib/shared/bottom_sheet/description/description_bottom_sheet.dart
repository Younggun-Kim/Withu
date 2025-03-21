import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:withu/core/utils/utils.dart';
import 'package:withu/gen/colors.gen.dart';
import 'package:withu/shared/shared.dart';

class DescriptionBottomSheet extends StatelessWidget {

  const DescriptionBottomSheet({
    super.key,
    required this.description,
    required this.actionText,
    required this.onTap,
  });
  final String description;

  final String actionText;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        children: <Widget>[
          Text(
            description,
            style: context.textTheme.bodySmall?.copyWith(
              color: ColorName.background,
            ),
          ),
          const SizedBox(height: 10),
          const Divider(height: 0.5, color: ColorName.secondary),
          BaseButton(
            text: Text(
              actionText,
              style: context.textTheme.bodyMediumBold?.copyWith(
                color: ColorName.background,
              ),
            ),
            backgroundColor: ColorName.primary,
            onTap: onTap,
          ),
        ],
      ),
    );
  }

  /// 바텀 시트 보기.
  static Future show({
    required BuildContext context,
    required DescriptionBottomSheetOption option,
    Bloc? bloc,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DescriptionBottomSheet(
          description: option.description,
          actionText: option.actionText,
          onTap: () {
            option.exec(bloc);
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
