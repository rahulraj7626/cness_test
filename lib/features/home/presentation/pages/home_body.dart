import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/extentions/size_extention.dart';
import 'package:cness_test/core/generated/assets.gen.dart';
import 'package:cness_test/core/shared/widgets/icon_widget.dart';
import 'package:cness_test/features/home/domain/entities/community_entity.dart';
import 'package:cness_test/features/home/domain/entities/feed_entity.dart'
    show FeedEntity;
import 'package:cness_test/features/home/domain/entities/story_entity.dart';
import 'package:cness_test/features/home/presentation/bloc/home_bloc.dart';
import 'package:cness_test/features/home/presentation/widgets/feeds/feed_widget.dart';
import 'package:cness_test/features/home/presentation/widgets/market_row.dart';
import 'package:cness_test/features/home/presentation/widgets/post_widgets.dart';
import 'package:cness_test/features/home/presentation/widgets/round_icon_button.dart';
import 'package:cness_test/features/home/presentation/widgets/search_widget.dart';
import 'package:cness_test/features/home/presentation/widgets/story_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

///Home Page from bottom navigation bar
class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<CommunityEntity> communities = [];
  List<FeedEntity> feeds = [];
  List<StoryEntity> stories = [];
  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final blueBackgroundHeight = topPadding + 100;

    ///Top background widget
    var positioned = Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: blueBackgroundHeight,
      child: Image.asset(Assets.images.homeBg.path, fit: BoxFit.cover),
    );
    return Stack(
      children: [
        positioned,
        Positioned(
          left: 0,
          right: 0,
          top: blueBackgroundHeight,
          child: Container(
            width: double.infinity,
            height: AppSpacing.s38,
            color: AppColors.white,
          ),
        ),

        SafeArea(
          bottom: false,
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is HomeErrorState) {
                return Center(child: Text(state.message));
              }
              if (state is HomeLoadedState) {
                communities = state.communities;
                feeds = state.feeds;
                stories = state.stories;
              }
              return Skeletonizer(
                enabled: stories.isEmpty && state is HomeLoadingState,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSpacing.s10.height,
                    _topWidgets(),
                    AppSpacing.s24.height,
                    const SearchWidget(),
                    AppSpacing.s8.height,
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          ///All Home UI widgets
                          const SliverToBoxAdapter(child: PostWidgets()),
                          SliverToBoxAdapter(
                            child: StoryWidget(stories: stories),
                          ),
                          const SliverToBoxAdapter(child: MarketRow()),

                          SliverFillRemaining(
                            hasScrollBody: true,
                            child: FeedWidget(
                              communities: communities,
                              feeds: feeds,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  ///Appbar widgets loke search notifications and comments
  Padding _topWidgets() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
      child: Row(
        children: [
          AppIcon(asset: Assets.icons.logo.path, size: AppSpacing.s32),
          Spacer(),
          RoundIconButton(icon: Assets.icons.search.path, onTap: () {}),
          RoundIconButton(icon: Assets.icons.notifications.path, onTap: () {}),
          RoundIconButton(icon: Assets.icons.comment.path, onTap: () {}),
        ],
      ),
    );
  }
}
