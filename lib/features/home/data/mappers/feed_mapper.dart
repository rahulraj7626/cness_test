import 'package:cness_test/features/home/data/mappers/community_mapper.dart';
import 'package:cness_test/features/home/data/models/feed/feed_model.dart';
import 'package:cness_test/features/home/domain/entities/feed_entity.dart';

extension FeedsModelMapper on FeedsModel {
  FeedsEntity toEntity() {
    return FeedsEntity(feeds: feeds.map((e) => e.toEntity()).toList());
  }
}

extension FeedModelMapper on FeedModel {
  FeedEntity toEntity() {
    return FeedEntity(user: user?.toEntity(), post: post?.toEntity());
  }
}

extension FeedUserModelMapper on FeedUserModel {
  FeedUserEntity toEntity() {
    return FeedUserEntity(
      name: name ?? '',
      profileImage: profileImage ?? '',
      lastActive: lastActive ?? '',
      verified: verified ?? false,
      tags: tags ?? 0,
      type: type ?? '',
    );
  }
}

extension PostModelMapper on PostModel {
  PostEntity toEntity() {
    return PostEntity(
      title: title ?? '',
      assets: assets?.map((e) => e.toEntity()).toList() ?? [],
      likes: likes ?? 0,
      comments: comments ?? 0,
      reaction: reaction ?? '',
      featuredComment: featuredComment?.toEntity(),
    );
  }
}

extension FeaturedCommentModelMapper on FeaturedCommentModel {
  FeaturedCommentEntity toEntity() {
    return FeaturedCommentEntity(
      user: user ?? '',
      comment: comment ?? '',
      time: time ?? '',
    );
  }
}
