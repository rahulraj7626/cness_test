import 'package:cness_test/core/exceptions/failure.dart';
import 'package:cness_test/features/home/data/datasources/home_datasource.dart';
import 'package:cness_test/features/home/data/mappers/community_mapper.dart';
import 'package:cness_test/features/home/data/mappers/feed_mapper.dart';
import 'package:cness_test/features/home/data/mappers/stories_mapper.dart';
import 'package:cness_test/features/home/domain/entities/community_entity.dart';
import 'package:cness_test/features/home/domain/entities/feed_entity.dart';
import 'package:cness_test/features/home/domain/entities/story_entity.dart';
import 'package:cness_test/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource datasource;

  HomeRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, CommunitiesEntity>> getCommunities() async {
    try {
      final communityModel = await datasource.getCommunities();
      return Right(communityModel.toEntity());
    } on Exception catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, FeedsEntity>> getFeeds() async {
    try {
      final feedsModel = await datasource.getFeeds();
      return Right(feedsModel.toEntity());
    } on Exception catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, StoriesEntity>> getStories() async {
    try {
      final storiesModel = await datasource.getStories();
      return Right(storiesModel.toEntity());
    } on Exception catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
