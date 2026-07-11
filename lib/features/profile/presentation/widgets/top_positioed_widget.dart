import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/extentions/list_extentions.dart';
import 'package:cness_test/core/extentions/size_extention.dart';
import 'package:cness_test/core/generated/assets.gen.dart';
import 'package:cness_test/core/shared/widgets/icon_widget.dart';
import 'package:cness_test/features/profile/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class TopPositioedWidget extends StatelessWidget {
  final ProfileEntity? data;
  const TopPositioedWidget({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 120,
          width: 120,
          padding: EdgeInsets.all(AppSpacing.s4),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
          ),
          child: AppIcon(asset: Assets.images.profile.path),
        ),
        Text(
          data?.name ?? '',
          style: TextStyle(
            fontSize: AppSpacing.s24,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        Text(
          (data?.specialization ?? []).joinLine,
          style: TextStyle(
            fontSize: AppSpacing.s16,
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
