import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/constants/string_contants.dart';
import 'package:cness_test/core/extentions/size_extention.dart';
import 'package:cness_test/features/profile/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class BasicInfo extends StatelessWidget {
  final BasicInfoEntity? data;
  const BasicInfo({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _itemWidget(data?.interests ?? [], AppString.interest),
        AppSpacing.s12.height,
        _itemWidget(data?.profession ?? [], AppString.professions),
      ],
    );
  }

  Column _itemWidget(List<String> data, String title) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: AppSpacing.s14,
          fontWeight: FontWeight.w400,
          color: AppColors.blueDark,
        ),
      ),
      AppSpacing.s8.height,
      Align(
        alignment: AlignmentGeometry.centerLeft,
        child: Wrap(
          spacing: AppSpacing.s8,
          runSpacing: AppSpacing.s8,
          children: data.map((item) => _chipWidget(item)).toList(),
        ),
      ),
    ],
  );

  Container _chipWidget(String label) => Container(
    margin: EdgeInsets.only(right: AppSpacing.s6),
    padding: EdgeInsets.symmetric(
      horizontal: AppSpacing.s10,
      vertical: AppSpacing.s4,
    ),
    decoration: BoxDecoration(
      color: AppColors.blueDark,
      borderRadius: BorderRadius.circular(AppSpacing.s32),
    ),
    child: Text(
      label,
      style: TextStyle(
        fontSize: AppSpacing.s14,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
    ),
  );
}
