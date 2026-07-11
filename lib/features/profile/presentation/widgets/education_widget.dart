import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/extentions/size_extention.dart';
import 'package:cness_test/core/shared/widgets/icon_widget.dart';
import 'package:cness_test/features/profile/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class EducationWidget extends StatelessWidget {
  final List<EducationEntity> data;

  const EducationWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(children: data.map((item) => _itemWidget(item)).toList());
  }

  Padding _itemWidget(EducationEntity data) => Padding(
    padding: const EdgeInsets.symmetric(vertical: AppSpacing.s6),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSpacing.s12),
          ),
          child: AppIcon(asset: data.image, size: 72),
        ),
        AppSpacing.s6.width,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.course,
                style: TextStyle(
                  fontSize: AppSpacing.s16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackPrimary,
                ),
              ),
              Text(
                data.school,
                style: TextStyle(
                  fontSize: AppSpacing.s14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackPrimary,
                ),
              ),
              Text(
                '${data.startDate} - ${data.endDate}',
                style: TextStyle(
                  fontSize: AppSpacing.s14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackSecondary,
                ),
              ),
              Text(
                data.location,
                style: TextStyle(
                  fontSize: AppSpacing.s14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackSecondary,
                ),
              ),
              _bulletColumnWidget(data.responsibilities),
              AppSpacing.s2.height,
            ],
          ),
        ),
      ],
    ),
  );
  Column _bulletColumnWidget(List<String> data) =>
      Column(children: data.map((item) => _bulletWidget(item)).toList());

  Row _bulletWidget(String data) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '•',
        style: TextStyle(
          fontSize: AppSpacing.s14,
          fontWeight: FontWeight.w500,
          color: AppColors.blackPrimary,
        ),
      ),
      SizedBox(width: AppSpacing.s4),
      Expanded(
        child: Text(
          data,
          style: TextStyle(
            fontSize: AppSpacing.s12,
            fontWeight: FontWeight.w500,
            color: AppColors.blackPrimary,
          ),
        ),
      ),
    ],
  );
}
