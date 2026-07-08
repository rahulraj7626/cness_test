import '../models/community/community_model.dart';
import '../models/feed/feed_model.dart';
import '../models/stories/stories_model.dart';

abstract class HomeDataSource {
  Future<CommunitiesModel> getCommunities();
  Future<FeedsModel> getFeeds();
  Future<StoriesModel> getStories();
}
