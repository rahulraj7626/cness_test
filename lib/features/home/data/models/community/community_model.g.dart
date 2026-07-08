// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunitiesModel _$CommunitiesModelFromJson(Map<String, dynamic> json) =>
    CommunitiesModel(
      communities: (json['communities'] as List<dynamic>?)
          ?.map((e) => CommunityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommunitiesModelToJson(CommunitiesModel instance) =>
    <String, dynamic>{
      'communities': instance.communities?.map((e) => e.toJson()).toList(),
    };

CommunityModel _$CommunityModelFromJson(Map<String, dynamic> json) =>
    CommunityModel(
      title: json['title'] as String?,
      asset: json['asset'] == null
          ? null
          : AssetModel.fromJson(json['asset'] as Map<String, dynamic>),
      members: (json['members'] as num?)?.toInt(),
      posts: (json['posts'] as num?)?.toInt(),
      frequency: json['frequency'] as String?,
    );

Map<String, dynamic> _$CommunityModelToJson(CommunityModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'asset': instance.asset?.toJson(),
      'members': instance.members,
      'posts': instance.posts,
      'frequency': instance.frequency,
    };
