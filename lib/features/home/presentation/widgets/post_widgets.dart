import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/extentions/size_extention.dart';
import 'package:cness_test/core/generated/assets.gen.dart';
import 'package:cness_test/core/shared/widgets/icon_widget.dart';
import 'package:flutter/material.dart';

///Top widget in column for post video and photos
class PostWidgets extends StatelessWidget {
  const PostWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppSpacing.s16),
          bottomRight: Radius.circular(AppSpacing.s16),
        ),
      ),

      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.s16,
        vertical: AppSpacing.s8,
      ),
      child: Row(
        children: [
          _getPostItem(Assets.icons.video.path, 'Create a Post'),
          AppSpacing.s12.width,
          _getPostItem(Assets.icons.photo.path, 'Live Video'),
        ],
      ),
    );
  }

  ///The post item widget
  Widget _getPostItem(String icon, String label) => Expanded(
    child: Container(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.s12),
      decoration: BoxDecoration(
        color: AppColors.greySecondary,
        borderRadius: BorderRadius.circular(AppSpacing.s10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppIcon(asset: icon, size: AppSpacing.s12),
          AppSpacing.s8.width,
          Text(
            label,
            style: TextStyle(
              fontSize: AppSpacing.s12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );
}
