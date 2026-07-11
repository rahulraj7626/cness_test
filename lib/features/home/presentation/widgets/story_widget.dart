import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/extentions/random.dart';
import 'package:cness_test/core/extentions/size_extention.dart';
import 'package:cness_test/core/generated/assets.gen.dart';
import 'package:cness_test/core/shared/widgets/icon_widget.dart';
import 'package:flutter/material.dart';

///Story Satcked list widget
class StoryWidget extends StatelessWidget {
  const StoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppSpacing.s16, left: AppSpacing.s16),
      child: SizedBox(
        height: 160,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, i) {
            return _buildStoryItem(index: i);
          },
        ),
      ),
    );
  }

  ///Story item widget
  Widget _buildStoryItem({required int index}) {
    final images = [
      Assets.images.yoga1.path,
      Assets.images.yoga2.path,
      Assets.images.yoga3.path,
    ];
    final dps = [
      Assets.images.dp1.path,
      Assets.images.dp2.path,
      Assets.images.dp3.path,
    ];
    final names = ['Erica Sinclair', 'John Doe', 'Jane Smith'];

    return Container(
      width: 90,
      margin: EdgeInsets.only(right: AppSpacing.s12),
      child: Column(
        children: [
          SizedBox(
            height: 130,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 118,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSpacing.s12),
                    image: DecorationImage(
                      image: AssetImage(images.randomItem() ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: index == 0
                      ? AppIcon(
                          asset: Assets.icons.plus.path,
                          size: AppSpacing.s24,
                        )
                      : Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.blueSecondary,
                              width: 2,
                            ),
                          ),
                          child: ClipOval(
                            child: AppIcon(
                              asset:
                                  (dps.randomItem() ??
                                  Assets.images.profile.path),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
          AppSpacing.s2.height,
          Text(
            names.randomItem() ?? '',
            style: TextStyle(
              fontSize: AppSpacing.s10,
              color: AppColors.blackPrimary,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
