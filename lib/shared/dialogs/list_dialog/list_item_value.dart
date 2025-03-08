import 'package:withu/feature/account/account.dart';

class ListDialogItemValue<T> {
  final String text;

  final T value;

  ListDialogItemValue({required this.text, required this.value});
}

extension ListDialogItemValues on ListDialogItemValue {
  static List<ListDialogItemValue<ChannelType>> channels() {
    return ChannelType.valuesWithoutNone
        .map((type) => ListDialogItemValue(text: type.toString(), value: type))
        .toList();
  }
}
