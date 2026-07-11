import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/constants/string_contants.dart';
import 'package:cness_test/core/extentions/int_extentions.dart';
import 'package:cness_test/core/extentions/size_extention.dart';
import 'package:cness_test/core/shared/widgets/icon_widget.dart';
import 'package:cness_test/features/home/domain/entities/community_entity.dart';
import 'package:flutter/material.dart';

///Community list widget in between posts
class CommunityWidget extends StatelessWidget {
  final List<CommunityEntity> data;
  const CommunityWidget({super.key, required this.data});

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
            itemCount: data.length,
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.s16),
            itemBuilder: (context, i) => _itemWidget(data[i]),
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
            AppString.communities,
            style: TextStyle(
              fontSize: AppSpacing.s16,
              fontWeight: FontWeight.w600,
              color: AppColors.blackPrimary,
            ),
          ),
          Text(
            AppString.seeAll,
            style: TextStyle(
              fontSize: AppSpacing.s14,
              fontWeight: FontWeight.w600,
              color: AppColors.blueSecondary,
            ),
          ),
        ],
      ),
    );
  }

  ///List item widget
  Widget _itemWidget(CommunityEntity data) => Container(
    width: 360,
    margin: EdgeInsets.only(right: AppSpacing.s16),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(AppSpacing.s16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_imageWidget(data.asset), _bottomWidget(data)],
    ),
  );

  Padding _bottomWidget(CommunityEntity data) {
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
                  data.title,
                  style: TextStyle(
                    fontSize: AppSpacing.s12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackPrimary,
                  ),
                ),

                Text(
                  '${data.members.compact} members . ${data.posts.compact} posts a day',
                  style: TextStyle(
                    fontSize: AppSpacing.s12,
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

  Expanded _imageWidget(AssetEntity data) {
    return Expanded(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(AppSpacing.s16)),
            child: SizedBox.expand(
              child: AppIcon(asset: data.url, fit: BoxFit.cover),
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
