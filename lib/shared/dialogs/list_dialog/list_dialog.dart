import 'package:flutter/material.dart';
import 'package:withu/core/utils/utils.dart';
import 'package:withu/feature/account/account.dart';
import 'package:withu/gen/colors.gen.dart';
import 'package:withu/shared/dialogs/dialogs.dart';
import 'package:withu/shared/dialogs/list_dialog/list_item_value.dart';

class ListDialog<T> extends StatelessWidget {
  final List<ListDialogItemValue<T>> items;

  final T selected;

  final Function(T) onPressed;

  const ListDialog({
    super.key,
    required this.items,
    required this.selected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      isVisibleClose: false,
      padding: EdgeInsets.zero,
      child: Column(
        children:
            items.map((item) {
              return InkWell(
                onTap: () {
                  onPressed(item.value);
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  clipBehavior: Clip.hardEdge,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:
                        selected == item.value
                            ? ColorName.tertiary
                            : Colors.white,
                    border: Border(
                      bottom: BorderSide(color: ColorName.tertiary),
                    ),
                  ),
                  child: Text(item.text, style: context.textTheme.bodyMedium),
                ),
              );
            }).toList(),
      ),
    );
  }

  static Future channels({
    required BuildContext context,
    required ChannelType selectedType,
    required Function(ChannelType) onPressed,
  }) {
    return showDialog(
      useRootNavigator: true,
      context: context,
      builder:
          (context) => ListDialog<ChannelType>(
            items: ListDialogItemValues.channels(),
            selected: selectedType,
            onPressed: (ChannelType type) {
              onPressed(type);
            },
          ),
    );
  }
}
