import 'package:auto_route/auto_route.dart';
import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/extentions/int_extentions.dart';
import 'package:cness_test/core/extentions/size_extention.dart';
import 'package:cness_test/core/generated/assets.gen.dart';
import 'package:cness_test/core/routes/app_router.dart';
import 'package:cness_test/core/shared/widgets/icon_widget.dart';
import 'package:cness_test/features/home/domain/entities/community_entity.dart';
import 'package:cness_test/features/home/domain/entities/feed_entity.dart';
import 'package:flutter/material.dart';

///Post widget list
class FeedPostWidget extends StatelessWidget {
  final FeedEntity data;
  const FeedPostWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSpacing.s16),
      padding: EdgeInsets.all(AppSpacing.s16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSpacing.s16),
        border: Border.all(color: AppColors.greyBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ///Header post owner widget
          _header(context, data.user),
          AppSpacing.s16.height,

          ///Content widget the text area
          _postContent(data.post?.title ?? ''),

          ///If Image list widget if images available
          if ((data.post?.assets ?? []).isNotEmpty) ...[
            AppSpacing.s16.height,
            _postImages(data.post?.assets ?? []),
          ],

          ///Bottom section like share comment
          _bottomWidget(data.post),

          ///Highlighted comments section
          if (data.post?.featuredComment != null) ...[
            const Divider(color: AppColors.greyBorder, height: AppSpacing.s24),
            GestureDetector(
              onTap: () => context.pushRoute(ProfileScreenRoute()),
              child: _bottomComments(data.post?.featuredComment),
            ),
          ],
        ],
      ),
    );
  }

  ///The post description
  Text _postContent(String description) {
    return Text(
      description,
      style: TextStyle(fontSize: AppSpacing.s13, color: AppColors.blackText),
    );
  }

  ///Image widget
  SizedBox _postImages(List<AssetEntity> data) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          Row(
            spacing: AppSpacing.s8,
            children: data.map((item) => _imageItem(item)).toList(),
          ),
          Positioned(
            bottom: AppSpacing.s12,
            right: AppSpacing.s12,
            child: CircleAvatar(
              radius: AppSpacing.s20,
              backgroundColor: AppColors.blueSecondary,
              child: const Icon(
                Icons.add_to_photos,
                color: AppColors.white,
                size: AppSpacing.s20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageItem(AssetEntity asset) => Expanded(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(AppSpacing.s12),
      child: SizedBox.expand(
        child: AppIcon(asset: asset.url, fit: BoxFit.cover),
      ),
    ),
  );

  ///Bottom comemnt section
  Widget _bottomComments(FeaturedCommentEntity? data) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        radius: AppSpacing.s16,
        backgroundImage: AssetImage(Assets.images.dp2.path),
      ),
      AppSpacing.s12.width,
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data?.user ?? '',
              style: TextStyle(
                fontSize: AppSpacing.s12,
                fontWeight: FontWeight.w600,
                color: AppColors.blackText,
              ),
            ),
            AppSpacing.s4.height,
            Text(
              data?.comment ?? '',
              style: TextStyle(
                fontSize: AppSpacing.s10,
                color: AppColors.blackSecondary,
              ),
            ),
            AppSpacing.s4.height,
            Text(
              'Like    Comment    ${data?.time ?? ''}',
              style: TextStyle(
                fontSize: AppSpacing.s10,
                fontWeight: FontWeight.w600,
                color: AppColors.blackText,
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
        child: const Icon(
          Icons.more_vert,
          color: AppColors.blackSecondary,
          size: AppSpacing.s18,
        ),
      ),
    ],
  );

  ///Header widget
  Widget _header(BuildContext context, FeedUserEntity? data) => Row(
    children: [
      GestureDetector(
        onTap: () => context.pushRoute(ProfileScreenRoute()),
        child: CircleAvatar(
          radius: AppSpacing.s20,
          backgroundImage: AssetImage(Assets.images.dp1.path),
        ),
      ),
      AppSpacing.s12.width,
      GestureDetector(
        onTap: () => context.pushRoute(ProfileScreenRoute()),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    data?.name ?? '',
                    style: TextStyle(
                      fontSize: AppSpacing.s14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackText,
                    ),
                  ),
                  AppSpacing.s4.width,
                  if (data?.verified == true)
                    Icon(
                      Icons.verified,
                      color: AppColors.bluePrimary,
                      size: AppSpacing.s16,
                    ),
                ],
              ),
              AppSpacing.s2.width,
              Row(
                children: [
                  Icon(
                    Icons.public,
                    color: AppColors.blackSecondary,
                    size: AppSpacing.s12,
                  ),
                  AppSpacing.s4.width,
                  Text(
                    data?.lastActive ?? "",
                    style: TextStyle(
                      fontSize: AppSpacing.s10,
                      color: AppColors.blackSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      CircleAvatar(
        radius: AppSpacing.s16,
        backgroundColor: AppColors.greySecondary,
        child: const Icon(Icons.more_horiz, color: AppColors.blackSecondary),
      ),
    ],
  );

  Widget _actionButton(IconData icon, {bool flip = false}) {
    return CircleAvatar(
      radius: AppSpacing.s18,
      backgroundColor: AppColors.bluePrimary.withAlpha(30),
      child: Transform.flip(
        flipX: flip,
        child: Icon(icon, color: AppColors.blueSecondary, size: AppSpacing.s18),
      ),
    );
  }

  Column _bottomWidget(PostEntity? data) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AppSpacing.s16.height,
      Row(
        children: [
          Text(
            '${data?.likes.compact} Likes . ',
            style: TextStyle(
              fontSize: AppSpacing.s10,
              color: AppColors.blueSecondary,
            ),
          ),
          Text(
            '${data?.comments.compact} Comments . ${data?.shares.compact} Shares',
            style: TextStyle(
              fontSize: AppSpacing.s10,
              color: AppColors.blackSecondary,
            ),
          ),
        ],
      ),

      AppSpacing.s16.height,

      // Actions
      Row(
        children: [
          _actionButton(Icons.thumb_up),
          AppSpacing.s12.width,
          _actionButton(Icons.comment),
          AppSpacing.s12.width,
          _actionButton(Icons.reply, flip: true),
          const Spacer(),
          const Text(
            'You Reacted',
            style: TextStyle(
              fontSize: AppSpacing.s12,
              color: AppColors.blackSecondary,
            ),
          ),
          AppSpacing.s8.width,
          AppIcon(
            asset: data?.reaction == 'like'
                ? Assets.icons.like.path
                : data?.reaction == 'heart'
                ? Assets.icons.heart.path
                : Assets.icons.star.path,
          ),
        ],
      ),
    ],
  );
}
