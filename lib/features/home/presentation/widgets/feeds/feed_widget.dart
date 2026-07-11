import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/features/home/domain/entities/community_entity.dart';
import 'package:cness_test/features/home/domain/entities/feed_entity.dart';
import 'package:cness_test/features/home/presentation/widgets/feeds/widgets/community_widget.dart';
import 'package:cness_test/features/home/presentation/widgets/feeds/widgets/feed_widget.dart';
import 'package:flutter/material.dart';

///Root of the feed widget
class FeedWidget extends StatelessWidget {
  final List<CommunityEntity> communities;
  final List<FeedEntity> feeds;
  const FeedWidget({super.key, required this.communities, required this.feeds});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: feeds.length + 1,
      itemBuilder: (context, i) {
        if (i == 1 || feeds.isEmpty) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: CommunityWidget(data: communities),
          );
        }

        final feedIndex = i > 1 ? i - 1 : i;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
          child: FeedPostWidget(data: feeds[feedIndex]),
        );
      },
    );
  }
}
