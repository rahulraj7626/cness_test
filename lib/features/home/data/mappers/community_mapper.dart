import 'package:cness_test/features/home/data/models/community/community_model.dart';
import 'package:cness_test/features/home/data/models/feed/feed_model.dart';
import 'package:cness_test/features/home/domain/entities/community_entity.dart';

extension CommunitiesModelMapper on CommunitiesModel {
  CommunitiesEntity toEntity() {
    return CommunitiesEntity(
      communities: communities?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}

extension CommunityModelMapper on CommunityModel {
  CommunityEntity toEntity() {
    return CommunityEntity(
      title: title ?? '',
      asset: asset?.toEntity() ?? const AssetEntity(type: '', url: ''),
      members: members ?? 0,
      posts: posts ?? 0,
      frequency: frequency ?? '',
    );
  }
}

//
extension AssetModelMapper on AssetModel {
  AssetEntity toEntity() {
    return AssetEntity(type: type ?? '', url: url ?? '');
  }
}
