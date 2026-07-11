import 'package:auto_route/auto_route.dart';
import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/constants/string_contants.dart';
import 'package:cness_test/core/extentions/size_extention.dart';
import 'package:cness_test/core/generated/assets.gen.dart';
import 'package:cness_test/core/routes/app_router.dart';
import 'package:cness_test/core/shared/widgets/icon_widget.dart';
import 'package:cness_test/features/home/domain/entities/community_entity.dart';
import 'package:cness_test/features/home/domain/entities/story_entity.dart';
import 'package:flutter/material.dart';

///Story Satcked list widget
class StoryWidget extends StatelessWidget {
  final List<StoryEntity> stories;

  const StoryWidget({super.key, required this.stories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppSpacing.s16, left: AppSpacing.s16),
      child: SizedBox(
        height: 160,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: stories.length + 1,
          itemBuilder: (context, i) {
            if (i == 0) {
              return _buildStoryItem(
                context,
                index: 0,
                data: StoryEntity(
                  assets: [
                    AssetEntity(type: 'image', url: Assets.images.story3.path),
                  ],
                  user: StoryUserEntity(name: '', profile: ''),
                ),
              );
            }

            return _buildStoryItem(context, index: i, data: stories[i - 1]);
          },
        ),
      ),
    );
  }

  ///Story item widget
  Widget _buildStoryItem(
    BuildContext context, {
    required int index,
    required StoryEntity data,
  }) {
    return GestureDetector(
      onTap: () => context.pushRoute(ProfileScreenRoute()),
      child: Container(
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
                        image: AssetImage(data.assets[0].url),
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
                                asset: data.user.profile,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
            AppSpacing.s2.height,
            Text(
              index == 0 ? AppString.addThoughts : data.user.name,
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
      ),
    );
  }
}
