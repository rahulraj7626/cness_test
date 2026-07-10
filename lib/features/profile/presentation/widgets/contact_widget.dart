import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/extentions/size_extention.dart';
import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_itemWidget(), _itemWidget(), _itemWidget()],
    );
  }

  Padding _itemWidget() => Padding(
    padding: const EdgeInsets.symmetric(vertical: AppSpacing.s6),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: TextStyle(
            fontSize: AppSpacing.s12,
            fontWeight: FontWeight.w500,
            color: AppColors.blueDark,
          ),
        ),
        AppSpacing.s2.height,
        Text(
          "Design",
          style: TextStyle(
            fontSize: AppSpacing.s14,
            fontWeight: FontWeight.w500,
            color: AppColors.blackPrimary,
          ),
        ),
      ],
    ),
  );
}
