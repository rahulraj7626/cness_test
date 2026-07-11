import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/extentions/size_extention.dart';
import 'package:cness_test/core/generated/assets.gen.dart';
import 'package:cness_test/core/shared/widgets/icon_widget.dart';
import 'package:flutter/material.dart';

class ExperianceWidget extends StatelessWidget {
  const ExperianceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [_itemWidget(), _itemWidget()]);
  }

  Padding _itemWidget() => Padding(
    padding: const EdgeInsets.symmetric(vertical: AppSpacing.s6),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.s12),
          ),
          child: AppIcon(asset: Assets.images.appIcon12.path, size: 72),
        ),
        AppSpacing.s6.width,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Lead Product",
                style: TextStyle(
                  fontSize: AppSpacing.s14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackPrimary,
                ),
              ),
              Text(
                "Lead Product",
                style: TextStyle(
                  fontSize: AppSpacing.s13,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackPrimary,
                ),
              ),
              Text(
                "Los Angeles, California",
                style: TextStyle(
                  fontSize: AppSpacing.s12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackSecondary,
                ),
              ),
              Text(
                "Los Angeles, California",
                style: TextStyle(
                  fontSize: AppSpacing.s12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackSecondary,
                ),
              ),
              _bulletColumnWidget(),
              AppSpacing.s2.height,
            ],
          ),
        ),
      ],
    ),
  );
  Column _bulletColumnWidget() =>
      Column(children: [_bulletWidget(), _bulletWidget(), _bulletWidget()]);

  Row _bulletWidget() => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '•',
        style: TextStyle(
          fontSize: AppSpacing.s12,
          fontWeight: FontWeight.w500,
          color: AppColors.blackPrimary,
        ),
      ),
      SizedBox(width: AppSpacing.s4),
      Expanded(
        child: Text(
          'Develop user flows based on target personas and flows based on target personas and concepts',
          style: TextStyle(
            fontSize: AppSpacing.s10,
            fontWeight: FontWeight.w500,
            color: AppColors.blackPrimary,
          ),
        ),
      ),
    ],
  );
}
