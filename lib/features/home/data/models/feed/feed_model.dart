import 'package:json_annotation/json_annotation.dart';

part 'feed_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FeedsModel {
  final List<FeedModel> feeds;

  const FeedsModel({required this.feeds});

  factory FeedsModel.fromJson(Map<String, dynamic> json) =>
      _$FeedsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeedsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FeedModel {
  final FeedUserModel? user;
  final PostModel? post;

  const FeedModel({required this.user, required this.post});

  factory FeedModel.fromJson(Map<String, dynamic> json) =>
      _$FeedModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeedModelToJson(this);
}

@JsonSerializable()
class FeedUserModel {
  final String? name;

  @JsonKey(name: 'profile_image')
  final String? profileImage;

  @JsonKey(name: 'last_active')
  final String? lastActive;

  final bool? verified;
  final int? tags;
  final String? type;

  const FeedUserModel({
    this.name,
    this.profileImage,
    this.lastActive,
    this.verified,
    this.tags,
    this.type,
  });

  factory FeedUserModel.fromJson(Map<String, dynamic> json) =>
      _$FeedUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeedUserModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PostModel {
  final String? title;
  final List<AssetModel>? assets;
  final int? likes;
  final int? comments;
  final String? reaction;

  @JsonKey(name: 'featured_comment')
  final FeaturedCommentModel? featuredComment;

  const PostModel({
    this.title,
    this.assets,
    this.likes,
    this.comments,
    this.reaction,
    this.featuredComment,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}

//
@JsonSerializable()
class AssetModel {
  final String? type;
  final String? url;

  const AssetModel({this.type, this.url});

  factory AssetModel.fromJson(Map<String, dynamic> json) =>
      _$AssetModelFromJson(json);

  Map<String, dynamic> toJson() => _$AssetModelToJson(this);
}

@JsonSerializable()
class FeaturedCommentModel {
  final String? user;
  final String? comment;
  final String? time;

  const FeaturedCommentModel({this.user, this.comment, this.time});

  factory FeaturedCommentModel.fromJson(Map<String, dynamic> json) =>
      _$FeaturedCommentModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeaturedCommentModelToJson(this);
}
