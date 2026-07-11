import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/constants/string_contants.dart';
import 'package:cness_test/core/extentions/size_extention.dart';
import 'package:cness_test/features/profile/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  final ContactEntity? data;
  const ContactWidget({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _itemWidget(AppString.email, data?.email ?? ''),
        _itemWidget(AppString.phoneNumber, data?.phone ?? ''),
        _itemWidget(AppString.address, data?.address ?? ''),
        _itemWidget(AppString.location, data?.location ?? ''),
      ],
    );
  }

  Padding _itemWidget(String key, String value) => Padding(
    padding: const EdgeInsets.symmetric(vertical: AppSpacing.s6),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          key,
          style: TextStyle(
            fontSize: AppSpacing.s12,
            fontWeight: FontWeight.w500,
            color: AppColors.blueDark,
          ),
        ),
        AppSpacing.s2.height,
        Text(
          value,
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
