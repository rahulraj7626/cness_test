import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/features/home/presentation/widgets/feeds/widgets/community_widget.dart';
import 'package:cness_test/features/home/presentation/widgets/feeds/widgets/feed_widget.dart';
import 'package:flutter/material.dart';

///Root of the feed widget
class FeedWidget extends StatefulWidget {
  const FeedWidget({super.key});

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, i) {
        ///In between community list
        ///Else return FeedPost widget
        return i == 1
            ? const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: CommunityWidget(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
                child: FeedPostWidget(hasImages: i % 2 == 0),
              );
      },
    );
  }
}
