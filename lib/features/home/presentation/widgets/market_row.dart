import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/constants/string_contants.dart';
import 'package:cness_test/core/extentions/size_extention.dart';
import 'package:cness_test/core/generated/assets.gen.dart';
import 'package:cness_test/core/shared/widgets/icon_widget.dart';
import 'package:flutter/material.dart';

///Catogories Marketplace , Directory etc.
///Widget
class MarketRow extends StatelessWidget {
  const MarketRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppSpacing.s16,
        right: AppSpacing.s16,
        top: AppSpacing.s2,
        bottom: AppSpacing.s12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _marketItem(Assets.icons.bag.path, AppString.marketplace),
          _marketItem(Assets.icons.directory.path, AppString.directory),
          _marketItem(Assets.icons.practices.path, AppString.bestPractices),
        ],
      ),
    );
  }

  ///The item widget
  Widget _marketItem(String icon, String text) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.s10,
          vertical: AppSpacing.s6,
        ),
        margin: EdgeInsets.symmetric(horizontal: AppSpacing.s4),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSpacing.s12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppIcon(asset: icon, size: AppSpacing.s24),
            AppSpacing.s2.height,
            Text(
              text,
              style: TextStyle(
                fontSize: AppSpacing.s12,
                fontWeight: FontWeight.w500,
                color: AppColors.blackPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
