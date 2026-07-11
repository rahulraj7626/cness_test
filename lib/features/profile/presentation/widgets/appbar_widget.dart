import 'package:auto_route/auto_route.dart';
import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/constants/string_contants.dart';
import 'package:cness_test/core/generated/assets.gen.dart';
import 'package:cness_test/core/shared/widgets/icon_widget.dart';
import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(onTap: () => context.pop(), child: _backButton()),
          _shareButton(),
        ],
      ),
    );
  }

  Container _backButton() => Container(
    height: AppSpacing.s38,
    width: 72,
    padding: EdgeInsets.all(AppSpacing.s8),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(AppSpacing.s48),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          (Icons.arrow_back),
          color: AppColors.blueSecondary,
          size: AppSpacing.s16,
        ),
        Text(
          AppString.back,
          style: TextStyle(
            fontSize: AppSpacing.s14,
            fontWeight: FontWeight.w600,
            color: AppColors.blackPrimary,
          ),
        ),
      ],
    ),
  );
  Container _shareButton() => Container(
    height: AppSpacing.s38,
    width: AppSpacing.s38,
    padding: EdgeInsets.all(AppSpacing.s10),
    decoration: BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
    child: AppIcon(asset: Assets.icons.share.path),
  );
}
