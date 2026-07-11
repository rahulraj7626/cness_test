// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedsModel _$FeedsModelFromJson(Map<String, dynamic> json) => FeedsModel(
  feeds: (json['feeds'] as List<dynamic>)
      .map((e) => FeedModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FeedsModelToJson(FeedsModel instance) =>
    <String, dynamic>{'feeds': instance.feeds.map((e) => e.toJson()).toList()};

FeedModel _$FeedModelFromJson(Map<String, dynamic> json) => FeedModel(
  user: json['user'] == null
      ? null
      : FeedUserModel.fromJson(json['user'] as Map<String, dynamic>),
  post: json['post'] == null
      ? null
      : PostModel.fromJson(json['post'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FeedModelToJson(FeedModel instance) => <String, dynamic>{
  'user': instance.user?.toJson(),
  'post': instance.post?.toJson(),
};

FeedUserModel _$FeedUserModelFromJson(Map<String, dynamic> json) =>
    FeedUserModel(
      name: json['name'] as String?,
      profileImage: json['profile_image'] as String?,
      lastActive: json['last_active'] as String?,
      verified: json['verified'] as bool?,
      tags: (json['tags'] as num?)?.toInt(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$FeedUserModelToJson(FeedUserModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profile_image': instance.profileImage,
      'last_active': instance.lastActive,
      'verified': instance.verified,
      'tags': instance.tags,
      'type': instance.type,
    };

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
  title: json['title'] as String?,
  assets: (json['assets'] as List<dynamic>?)
      ?.map((e) => AssetModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  likes: (json['likes'] as num?)?.toInt(),
  comments: (json['comments'] as num?)?.toInt(),
  shares: (json['shares'] as num?)?.toInt(),
  reaction: json['reaction'] as String?,
  featuredComment: json['featured_comment'] == null
      ? null
      : FeaturedCommentModel.fromJson(
          json['featured_comment'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
  'title': instance.title,
  'assets': instance.assets?.map((e) => e.toJson()).toList(),
  'likes': instance.likes,
  'shares': instance.shares,
  'comments': instance.comments,
  'reaction': instance.reaction,
  'featured_comment': instance.featuredComment?.toJson(),
};

AssetModel _$AssetModelFromJson(Map<String, dynamic> json) =>
    AssetModel(type: json['type'] as String?, url: json['url'] as String?);

Map<String, dynamic> _$AssetModelToJson(AssetModel instance) =>
    <String, dynamic>{'type': instance.type, 'url': instance.url};

FeaturedCommentModel _$FeaturedCommentModelFromJson(
  Map<String, dynamic> json,
) => FeaturedCommentModel(
  user: json['user'] as String?,
  comment: json['comment'] as String?,
  time: json['time'] as String?,
);

Map<String, dynamic> _$FeaturedCommentModelToJson(
  FeaturedCommentModel instance,
) => <String, dynamic>{
  'user': instance.user,
  'comment': instance.comment,
  'time': instance.time,
};
