import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/constants/string_contants.dart';
import 'package:cness_test/core/extentions/size_extention.dart';
import 'package:flutter/material.dart';

class BasicInfo extends StatelessWidget {
  const BasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_itemWidget(), AppSpacing.s12.height, _itemWidget()],
    );
  }

  Column _itemWidget() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        AppString.interest,
        style: TextStyle(
          fontSize: AppSpacing.s12,
          fontWeight: FontWeight.w400,
          color: AppColors.blueDark,
        ),
      ),
      AppSpacing.s8.height,
      Row(children: [_shareButton(), _shareButton(), _shareButton()]),
    ],
  );

  Container _shareButton() => Container(
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
      "Design",
      style: TextStyle(
        fontSize: AppSpacing.s12,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
    ),
  );
}
