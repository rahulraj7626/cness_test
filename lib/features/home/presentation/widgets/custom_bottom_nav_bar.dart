import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/generated/assets.gen.dart';
import 'package:cness_test/core/shared/widgets/icon_widget.dart';
import 'package:flutter/material.dart';

///The custom bottom navigation bar with 5 items
///Callback as onItemTapped with index
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSpacing.s32),
          topRight: Radius.circular(AppSpacing.s32),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: AppSpacing.s10,
            spreadRadius: AppSpacing.s2,
            offset: Offset(0, -2),
          ),
        ],
      ),

      ///Build bottom nav items and return with its index
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIconButton(0, Assets.icons.bottom1.path),
          _buildIconButton(1, Assets.icons.bottom2.path),
          _buildIconButton(2, Assets.icons.bottom3.path),
          _buildIconButton(3, Assets.icons.bottom4.path),
          _buildProfileIcon(4),
        ],
      ),
    );
  }

  ///Bottom nav item widget
  Widget _buildIconButton(int index, String icon) {
    final isActive = selectedIndex == index;
    return InkWell(
      onTap: () => onItemTapped(index),
      child: AppIcon(
        asset: icon,
        color: isActive ? AppColors.blueSecondary : AppColors.blackSecondary,
      ),
    );
  }

  ///Profile item widget
  Widget _buildProfileIcon(int index) {
    final isActive = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isActive ? AppColors.blueSecondary : Colors.transparent,
            width: AppSpacing.s2,
          ),
        ),
        child: AppIcon(asset: Assets.images.dp1.path, size: AppSpacing.s24),
      ),
    );
  }
}
