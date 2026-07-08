import 'package:cness_test/core/exceptions/failure.dart';
import 'package:cness_test/features/home/domain/entities/community_entity.dart';
import 'package:cness_test/features/home/domain/entities/feed_entity.dart';
import 'package:cness_test/features/home/domain/entities/story_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, CommunitiesEntity>> getCommunities();
  Future<Either<Failure, FeedsEntity>> getFeeds();
  Future<Either<Failure, StoriesEntity>> getStories();
}
