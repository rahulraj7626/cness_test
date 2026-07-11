import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/constants/string_contants.dart';
import 'package:cness_test/core/extentions/size_extention.dart';
import 'package:cness_test/core/generated/assets.gen.dart';
import 'package:cness_test/core/shared/widgets/icon_widget.dart';
import 'package:flutter/material.dart';

///Stack positioned widget- AI search widget
class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSpacing.s48,
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.s6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppSpacing.s24),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackSecondary.withAlpha(70),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: AppSpacing.s16,
            backgroundColor: Colors.black,
            child: AppIcon(asset: Assets.images.appIcon12.path),
          ),
          AppSpacing.s12.width,
          Expanded(
            child: Text(
              AppString.searchHint,
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: AppSpacing.s13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          AppSpacing.s4.width,
          AppIcon(asset: Assets.icons.ai.path, size: AppSpacing.s20),
          AppSpacing.s8.width,
        ],
      ),
    );
  }
}
