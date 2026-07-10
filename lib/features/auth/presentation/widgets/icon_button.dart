import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/shared/widgets/icon_widget.dart';
import 'package:cness_test/core/shared/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

///IconButton used for social login
///Handled loading , actions , icon and text

class IconButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final String icon;
  final bool isLoading;

  const IconButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    required this.icon,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: isLoading ? null : onTap,
      icon: isLoading
          ? const SizedBox(
              width: 18,
              height: 18,
              child: LoadingWidget(color: AppColors.bluePrimary),
            )
          : AppIcon(asset: icon, size: AppSpacing.s18),
      label: Text(
        text,
        style: const TextStyle(
          fontSize: AppSpacing.s14,
          color: AppColors.blackPrimary,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: OutlinedButton.styleFrom(
        fixedSize: const Size.fromHeight(AppSpacing.s48),
        // or minimumSize: const Size(double.infinity, AppSpacing.s48),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        side: const BorderSide(color: AppColors.greyBorder),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
