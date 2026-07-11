import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/constants/string_contants.dart';
import 'package:cness_test/core/extentions/size_extention.dart';
import 'package:cness_test/core/generated/assets.gen.dart';
import 'package:cness_test/core/shared/widgets/icon_widget.dart';
import 'package:flutter/material.dart';

///Login Top widget
class TopAppbar extends StatelessWidget {
  const TopAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 160.0,
      pinned: true,
      centerTitle: false,
      elevation: 0,
      backgroundColor: AppColors.blueTertiary,
      title: AppIcon(asset: Assets.icons.logo.path, size: 32),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Assets.images.loginBg.provider(),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.s16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppString.getStarted,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: AppSpacing.s32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppSpacing.s8.height,
                Text(
                  AppString.createAnAccount,
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                AppSpacing.s8.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
