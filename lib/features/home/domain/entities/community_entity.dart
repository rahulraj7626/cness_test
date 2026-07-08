class CommunitiesEntity {
  final List<CommunityEntity> communities;

  const CommunitiesEntity({required this.communities});
}

class CommunityEntity {
  final String title;
  final AssetEntity asset;
  final int members;
  final int posts;
  final String frequency;

  const CommunityEntity({
    required this.title,
    required this.asset,
    required this.members,
    required this.posts,
    required this.frequency,
  });
}

class AssetEntity {
  final String type;
  final String url;

  const AssetEntity({required this.type, required this.url});
}
