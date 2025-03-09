import 'package:flutter/cupertino.dart';
import 'package:toastification/toastification.dart';
import 'package:withu/core/core.dart';
import 'package:withu/gen/colors.gen.dart';

class Toast {
  static show({required BuildContext context, required String text}) {
    toastification.dismissAll();

    return toastification.showCustom(
      context: context,
      autoCloseDuration: const Duration(seconds: 1),
      alignment: Alignment.bottomCenter,
      builder: (BuildContext context, ToastificationItem holder) {
        return CustomToast(text: text);
      },
    );
  }

  static showWithNavigatorKey({required String text}) {
    return toastification.showCustom(
      overlayState: getItAppRouter.navigatorKey.currentState?.overlay,
      autoCloseDuration: const Duration(seconds: 1),
      alignment: Alignment.bottomCenter,
      builder: (BuildContext context, ToastificationItem holder) {
        return CustomToast(text: text);
      },
    );
  }
}

class CustomToast extends StatelessWidget {
  final String text;

  const CustomToast({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(50, 0, 50, 60),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: ColorName.primary,
      ),
      child: Text(text, style: context.textTheme.bodyMediumBold?.setWhite),
    );
  }
}
