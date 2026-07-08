import 'package:cness_test/features/home/domain/entities/community_entity.dart';

class FeedsEntity {
  final List<FeedEntity> feeds;

  const FeedsEntity({required this.feeds});
}

class FeedEntity {
  final FeedUserEntity? user;
  final PostEntity? post;

  const FeedEntity({this.user, this.post});
}

class FeedUserEntity {
  final String name;
  final String profileImage;
  final String lastActive;
  final bool verified;
  final int tags;
  final String type;

  const FeedUserEntity({
    required this.name,
    required this.profileImage,
    required this.lastActive,
    required this.verified,
    required this.tags,
    required this.type,
  });
}

class PostEntity {
  final String title;
  final List<AssetEntity> assets;
  final int likes;
  final int comments;
  final String reaction;
  final FeaturedCommentEntity? featuredComment;

  const PostEntity({
    required this.title,
    required this.assets,
    required this.likes,
    required this.comments,
    required this.reaction,
    this.featuredComment,
  });
}

class FeaturedCommentEntity {
  final String user;
  final String comment;
  final String time;

  const FeaturedCommentEntity({
    required this.user,
    required this.comment,
    required this.time,
  });
}
