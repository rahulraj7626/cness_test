import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/extentions/size_extention.dart';
import 'package:cness_test/core/generated/assets.gen.dart';
import 'package:cness_test/core/shared/widgets/icon_widget.dart';
import 'package:flutter/material.dart';

class TopPositioedWidget extends StatelessWidget {
  const TopPositioedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 120,
          width: 120,
          padding: EdgeInsets.all(AppSpacing.s4),
          decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
          ),
          child: AppIcon(asset: Assets.images.profile.path),
        ),
        Text(
          "Nandhiji",
          style: TextStyle(
            fontSize: AppSpacing.s24,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        Text(
          "Yoga Master l Environmentalist",
          style: TextStyle(
            fontSize: AppSpacing.s14,
            fontWeight: FontWeight.w400,
            color: AppColors.white,
          ),
          textAlign: TextAlign.center,
        ),
        AppSpacing.s10.height,
      ],
    );
  }
}
