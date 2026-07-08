// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoriesModel _$StoriesModelFromJson(Map<String, dynamic> json) => StoriesModel(
  stories: (json['stories'] as List<dynamic>?)
      ?.map((e) => StoryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$StoriesModelToJson(StoriesModel instance) =>
    <String, dynamic>{
      'stories': instance.stories?.map((e) => e.toJson()).toList(),
    };

StoryModel _$StoryModelFromJson(Map<String, dynamic> json) => StoryModel(
  user: json['user'] == null
      ? null
      : StoryUserModel.fromJson(json['user'] as Map<String, dynamic>),
  assets: (json['assets'] as List<dynamic>?)
      ?.map((e) => AssetModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$StoryModelToJson(StoryModel instance) =>
    <String, dynamic>{
      'user': instance.user?.toJson(),
      'assets': instance.assets?.map((e) => e.toJson()).toList(),
    };

StoryUserModel _$StoryUserModelFromJson(Map<String, dynamic> json) =>
    StoryUserModel(
      name: json['name'] as String?,
      profile: json['profile'] as String?,
    );

Map<String, dynamic> _$StoryUserModelToJson(StoryUserModel instance) =>
    <String, dynamic>{'name': instance.name, 'profile': instance.profile};
