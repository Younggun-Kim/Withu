import 'package:flutter/cupertino.dart';
import 'package:withu/core/core.dart';
import 'package:withu/feature/account/domain/type/field_type.dart';
import 'package:withu/gen/colors.gen.dart';

class FieldTag extends StatelessWidget {
  final FieldType field;

  const FieldTag({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    if (field.isNone) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
      decoration: BoxDecoration(
        border: Border.all(color: ColorName.primary),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(field.toKor(), style: context.textTheme.bodySmall),
    );
  }
}
