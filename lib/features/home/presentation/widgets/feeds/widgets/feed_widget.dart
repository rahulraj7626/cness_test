import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/extentions/size_extention.dart';
import 'package:cness_test/core/generated/assets.gen.dart';
import 'package:cness_test/core/shared/widgets/icon_widget.dart';
import 'package:flutter/material.dart';

///Post widget list
class FeedPostWidget extends StatelessWidget {
  final bool hasImages;
  const FeedPostWidget({super.key, required this.hasImages});

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
          _header(),
          AppSpacing.s16.height,

          ///Content widget the text area
          _postContent(),

          ///If Image list widget if images available
          if (hasImages) ...[AppSpacing.s16.height, _postImages()],

          ///Bottom section like share comment
          _bottomWidget(),
          const Divider(color: AppColors.greyBorder, height: AppSpacing.s24),

          ///Highlighted comments section
          _bottomComments(),
        ],
      ),
    );
  }

  ///The post description
  Text _postContent() {
    return const Text(
      'Hey pals ✨ Happy to share that I\'ve completed a set of yoga-themed photos, flowing with calming hues and mindful vibrations 🌸🧘‍♀️',
      style: TextStyle(fontSize: AppSpacing.s13, color: AppColors.blackText),
    );
  }

  ///Image widget
  SizedBox _postImages() {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          Row(
            spacing: AppSpacing.s8,
            children: [
              _imageItem(Assets.images.yoga1.path),
              _imageItem(Assets.images.yoga2.path),
              _imageItem(Assets.images.yoga3.path),
            ],
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

  Widget _imageItem(String asset) => Expanded(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(AppSpacing.s12),
      child: SizedBox.expand(
        child: AppIcon(asset: asset, fit: BoxFit.cover),
      ),
    ),
  );

  ///Bottom comemnt section
  Widget _bottomComments() => Row(
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
              'Mark Ramos',
              style: TextStyle(
                fontSize: AppSpacing.s12,
                fontWeight: FontWeight.w600,
                color: AppColors.blackText,
              ),
            ),
            AppSpacing.s4.height,
            Text(
              'Greet work! Well done girl. 👏',
              style: TextStyle(
                fontSize: AppSpacing.s10,
                color: AppColors.blackSecondary,
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
  Widget _header() => Row(
    children: [
      CircleAvatar(
        radius: AppSpacing.s20,
        backgroundImage: AssetImage(Assets.images.dp1.path),
      ),
      AppSpacing.s12.width,
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Anna Mary',
                  style: TextStyle(
                    fontSize: AppSpacing.s14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackText,
                  ),
                ),
                AppSpacing.s4.width,
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
                  '2 Hours ago',
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

  Column _bottomWidget() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      AppSpacing.s16.height,
      Row(
        children: [
          const Text(
            '361k Likes . ',
            style: TextStyle(
              fontSize: AppSpacing.s10,
              color: AppColors.blueSecondary,
            ),
          ),
          const Text(
            '3.4k Comments . 46 Shares',
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
          const SizedBox(width: 8),
          const Icon(
            Icons.favorite,
            color: AppColors.red,
            size: AppSpacing.s20,
          ),
        ],
      ),
    ],
  );
}
