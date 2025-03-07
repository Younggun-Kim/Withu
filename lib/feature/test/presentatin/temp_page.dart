import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:withu/core/core.dart';
import 'package:withu/shared/shared.dart';
import 'package:withu/shared/widgets/multi_input/ymd_input.dart';

@RoutePage()
class TempPage extends StatelessWidget {
  const TempPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _TempPageContent();
  }
}

class _TempPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageRoot(
      isLoading: false,
      child: Center(
        child: YmdInput(
          onChanged: (String value) {
            logger.i(value);
          },
        ),
      ),
    );
  }
}
