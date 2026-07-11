import 'package:cness_test/core/constants/app_colors.dart';
import 'package:cness_test/core/constants/app_spacing.dart';
import 'package:cness_test/core/di/injection_container.dart';
import 'package:cness_test/core/extentions/size_extention.dart';
import 'package:cness_test/core/generated/assets.gen.dart';
import 'package:cness_test/core/shared/widgets/icon_widget.dart';
import 'package:cness_test/features/home/presentation/bloc/home_bloc.dart';
import 'package:cness_test/features/home/presentation/widgets/feeds/feed_widget.dart';
import 'package:cness_test/features/home/presentation/widgets/market_row.dart';
import 'package:cness_test/features/home/presentation/widgets/post_widgets.dart';
import 'package:cness_test/features/home/presentation/widgets/round_icon_button.dart';
import 'package:cness_test/features/home/presentation/widgets/search_widget.dart';
import 'package:cness_test/features/home/presentation/widgets/story_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///Home Page from bottom navigation bar
class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
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
    return BlocProvider(
      create: (_) => sl<HomeBloc>()..add(OnLoadHomeDataEvent()),
      child: Stack(
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
                      const SliverToBoxAdapter(child: StoryWidget()),
                      const SliverToBoxAdapter(child: MarketRow()),

                      SliverFillRemaining(
                        hasScrollBody: true,
                        child: FeedWidget(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
 //  BlocBuilder<HomeBloc, HomeState>(
        //   builder: (context, state) {
        //     if (state is HomeLoadedState) {
        //       return Column(children: [Text(state.stories.length.toString())]);
        //     }
        //     if (state is HomeErrorState) {
        //       return Center(child: Text(state.message));
        //     }
        //     return Center(child: CircularProgressIndicator());
        //   },
        // ),