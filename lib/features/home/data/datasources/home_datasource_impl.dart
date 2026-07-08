import 'package:cness_test/core/generated/assets.gen.dart';
import 'package:cness_test/core/shared/data/base_datasouce.dart';

import '../models/community/community_model.dart';
import '../models/feed/feed_model.dart';
import '../models/stories/stories_model.dart';
import 'home_datasource.dart';

class HomeDataSourceImpl extends BaseDataSource implements HomeDataSource {
  @override
  Future<CommunitiesModel> getCommunities() async {
    return CommunitiesModel.fromJson(
      await loadJson(Assets.json.home.communities),
    );
  }

  @override
  Future<FeedsModel> getFeeds() async {
    return FeedsModel.fromJson(await loadJson(Assets.json.home.feed));
  }

  @override
  Future<StoriesModel> getStories() async {
    return StoriesModel.fromJson(await loadJson(Assets.json.home.stories));
  }
}
