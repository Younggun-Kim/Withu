import 'dart:async';
import 'package:flutter/material.dart';
import 'package:withu/gen/assets.gen.dart';

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({super.key});

  @override
  State<StatefulWidget> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation> {
  int _currentIndex = 0;
  final duration = Duration(milliseconds: 200);
  final images = [
    Assets.images.loading1,
    Assets.images.loading2,
    Assets.images.loading3,
    Assets.images.loading4,
    Assets.images.loading5,
    Assets.images.loading6,
  ];

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Timer.periodic(duration, (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        _currentIndex = (_currentIndex + 1) % images.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: duration,
        transitionBuilder: (widget, animation) {
          return FadeTransition(opacity: animation, child: widget);
        },
        child: images[_currentIndex].svg(),
      ),
    );
  }
}
