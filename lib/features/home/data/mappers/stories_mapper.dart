import 'package:cness_test/features/home/data/mappers/community_mapper.dart';
import 'package:cness_test/features/home/data/models/stories/stories_model.dart';
import 'package:cness_test/features/home/domain/entities/story_entity.dart';

extension StoriesModelMapper on StoriesModel {
  StoriesEntity toEntity() {
    return StoriesEntity(
      stories: stories?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension StoryModelMapper on StoryModel {
  StoryEntity toEntity() {
    return StoryEntity(
      user: user?.toEntity() ?? const StoryUserEntity(name: '', profile: ''),
      assets: assets?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension StoryUserModelMapper on StoryUserModel {
  StoryUserEntity toEntity() {
    return StoryUserEntity(name: name ?? '', profile: profile ?? '');
  }
}
