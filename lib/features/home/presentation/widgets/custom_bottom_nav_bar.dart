import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIconButton(0, Icons.home_rounded),
          _buildIconButton(1, Icons.slow_motion_video_rounded),
          _buildIconButton(2, Icons.storefront_rounded),
          _buildTwoCirclesIcon(3),
          _buildProfileIcon(4),
        ],
      ),
    );
  }

  Widget _buildIconButton(int index, IconData icon) {
    final isActive = selectedIndex == index;
    return IconButton(
      icon: Icon(
        icon,
        size: 30,
        color: isActive ? const Color(0xFF5E60CE) : const Color(0xFF9E9E9E),
      ),
      onPressed: () => onItemTapped(index),
    );
  }

  Widget _buildTwoCirclesIcon(int index) {
    final isActive = selectedIndex == index;
    final color = isActive ? const Color(0xFF5E60CE) : const Color(0xFF9E9E9E);

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: SizedBox(
        width: AppSpacing.s48,
        height: AppSpacing.s48,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 8,
              bottom: 10,
              child: Container(
                width: AppSpacing.s20,
                height: AppSpacing.s20,
                decoration: BoxDecoration(shape: BoxShape.circle, color: color),
              ),
            ),
            Positioned(
              right: AppSpacing.s8,
              top: 10,
              child: Container(
                width: AppSpacing.s16,
                height: AppSpacing.s16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                  border: Border.all(color: Colors.white, width: AppSpacing.s2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileIcon(int index) {
    final isActive = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Container(
        padding: EdgeInsets.all(AppSpacing.s4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isActive ? const Color(0xFF5E60CE) : Colors.transparent,
            width: AppSpacing.s2,
          ),
        ),
        child: const CircleAvatar(
          radius: AppSpacing.s16,
          backgroundColor: Colors.black,

          child: Icon(Icons.person, size: AppSpacing.s20, color: Colors.white),
        ),
      ),
    );
  }
}
