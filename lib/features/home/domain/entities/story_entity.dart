import 'package:cness_test/features/home/domain/entities/community_entity.dart';

class StoriesEntity {
  final List<StoryEntity> stories;

  const StoriesEntity({required this.stories});
}

class StoryEntity {
  final StoryUserEntity user;
  final List<AssetEntity> assets;

  const StoryEntity({required this.user, required this.assets});
}

class StoryUserEntity {
  final String name;
  final String profile;

  const StoryUserEntity({required this.name, required this.profile});
}
