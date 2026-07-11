import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/constants/string_contants.dart';
import 'package:cness_test/core/extentions/size_extention.dart';
import 'package:cness_test/core/generated/assets.gen.dart';
import 'package:cness_test/core/shared/widgets/icon_widget.dart';
import 'package:flutter/material.dart';

class SocialRow extends StatelessWidget {
  const SocialRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSpacing.s16),
      padding: EdgeInsets.all(AppSpacing.s8),
      decoration: BoxDecoration(
        color: AppColors.blueDark.withAlpha(70),
        borderRadius: BorderRadius.circular(AppSpacing.s12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _socialItem(Assets.icons.watsap.path, AppString.whatsapp),
          _socialItem(Assets.icons.fb.path, AppString.facebook),
          _socialItem(Assets.icons.tiktok.path, AppString.tiktok),
          _socialItem(Assets.icons.website.path, AppString.website),
        ],
      ),
    );
  }

  Column _socialItem(String icon, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        AppIcon(asset: icon, size: AppSpacing.s24),
        AppSpacing.s4.height,
        Text(
          text,
          style: TextStyle(
            fontSize: AppSpacing.s12,
            fontWeight: FontWeight.w400,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
