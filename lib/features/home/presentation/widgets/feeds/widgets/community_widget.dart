import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/extentions/size_extention.dart';
import 'package:cness_test/core/generated/assets.gen.dart';
import 'package:cness_test/core/shared/widgets/icon_widget.dart';
import 'package:flutter/material.dart';

///Community list widget in between posts
class CommunityWidget extends StatelessWidget {
  const CommunityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _titleWidget(),
        SizedBox(
          height: 200,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.s16),
            itemBuilder: (context, i) => _itemWidget(),
          ),
        ),
      ],
    );
  }

  Padding _titleWidget() {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppSpacing.s16,
        right: AppSpacing.s16,
        bottom: AppSpacing.s12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Communities you might like',
            style: TextStyle(
              fontSize: AppSpacing.s16,
              fontWeight: FontWeight.w600,
              color: AppColors.blackPrimary,
            ),
          ),
          Text(
            'See all',
            style: TextStyle(
              fontSize: AppSpacing.s12,
              fontWeight: FontWeight.w600,
              color: AppColors.blueSecondary,
            ),
          ),
        ],
      ),
    );
  }

  ///List item widget
  Widget _itemWidget() => Container(
    width: 300,
    margin: EdgeInsets.only(right: AppSpacing.s16),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(AppSpacing.s16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_imageWidget(), _bottomWidget()],
    ),
  );

  Padding _bottomWidget() {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.s12),
      child: Row(
        children: [
          Icon(
            Icons.groups,
            color: AppColors.blueSecondary,
            size: AppSpacing.s24,
          ),
          AppSpacing.s6.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'InnerPeace',
                  style: TextStyle(
                    fontSize: AppSpacing.s12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackPrimary,
                  ),
                ),

                Text(
                  '274kmembers . 10 posts a day',
                  style: TextStyle(
                    fontSize: AppSpacing.s10,
                    color: AppColors.blackSecondary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: AppSpacing.s6,
              horizontal: AppSpacing.s12,
            ),
            decoration: BoxDecoration(
              color: AppColors.blueSecondary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Join group',
              style: TextStyle(
                fontSize: AppSpacing.s10,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Expanded _imageWidget() {
    return Expanded(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(AppSpacing.s16)),
            child: SizedBox.expand(
              child: AppIcon(
                asset: Assets.images.community1.path,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: AppSpacing.s12,
            right: AppSpacing.s12,
            child: CircleAvatar(
              radius: AppSpacing.s14,
              backgroundColor: AppColors.blackPrimary.withAlpha(30),
              child: Icon(
                Icons.close,
                size: AppSpacing.s16,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
