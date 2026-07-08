import 'package:cness_test/features/home/data/models/feed/feed_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'community_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CommunitiesModel {
  final List<CommunityModel>? communities;

  const CommunitiesModel({this.communities});

  factory CommunitiesModel.fromJson(Map<String, dynamic> json) =>
      _$CommunitiesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommunitiesModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CommunityModel {
  final String? title;
  final AssetModel? asset;
  final int? members;
  final int? posts;
  final String? frequency;

  const CommunityModel({
    this.title,
    this.asset,
    this.members,
    this.posts,
    this.frequency,
  });

  factory CommunityModel.fromJson(Map<String, dynamic> json) =>
      _$CommunityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityModelToJson(this);
}
