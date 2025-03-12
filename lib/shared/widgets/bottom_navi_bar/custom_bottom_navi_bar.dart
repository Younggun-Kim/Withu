import 'package:flutter/material.dart';
import 'package:withu/gen/assets.gen.dart';

class CustomBottomNaviBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNaviBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            offset: Offset(0, 2),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: BottomNavigationBar(
        selectedFontSize: 16,
        unselectedFontSize: 16,
        fixedColor: Colors.white,
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            icon: Assets.images.navIconCalendarOff.svg(),
            activeIcon: Assets.images.navIconCalendarOn.svg(),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Assets.images.navIconSearchOff.svg(),
            activeIcon: Assets.images.navIconSearchOn.svg(),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Assets.images.navIconJobOff.svg(),
            activeIcon: Assets.images.navIconJobOn.svg(),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Assets.images.navIconProfileOff.svg(),
            activeIcon: Assets.images.navIconProfileOn.svg(),
            label: '',
          ),
        ],
      ),
    );
  }
}
