import 'package:cness_test/features/home/data/models/feed/feed_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stories_model.g.dart';

@JsonSerializable(explicitToJson: true)
class StoriesModel {
  final List<StoryModel>? stories;

  const StoriesModel({this.stories});

  factory StoriesModel.fromJson(Map<String, dynamic> json) =>
      _$StoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoriesModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StoryModel {
  final StoryUserModel? user;
  final List<AssetModel>? assets;

  const StoryModel({this.user, this.assets});

  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoryModelToJson(this);
}

@JsonSerializable()
class StoryUserModel {
  final String? name;
  final String? profile;

  const StoryUserModel({this.name, this.profile});

  factory StoryUserModel.fromJson(Map<String, dynamic> json) =>
      _$StoryUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoryUserModelToJson(this);
}
