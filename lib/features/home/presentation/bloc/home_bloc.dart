import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cness_test/core/exceptions/failure.dart';
import 'package:cness_test/core/shared/domain/usecases/no_params.dart';
import 'package:cness_test/features/home/domain/entities/community_entity.dart';
import 'package:cness_test/features/home/domain/entities/feed_entity.dart';
import 'package:cness_test/features/home/domain/entities/story_entity.dart';
import 'package:cness_test/features/home/domain/usecases/get_communites_usecase.dart';
import 'package:cness_test/features/home/domain/usecases/get_feeds_usecase.dart';
import 'package:cness_test/features/home/domain/usecases/get_stories_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetStoriesUsecase storiesUsecase;
  final GetFeedsUsecase feedsUsecase;
  final GetCommunitesUsecase communityUsecase;
  HomeBloc({
    required this.storiesUsecase,
    required this.feedsUsecase,
    required this.communityUsecase,
  }) : super(HomeInitial()) {
    on<HomeEvent>(onLoadHomeEvent);
  }

  Future<void> onLoadHomeEvent(HomeEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    try {
      final results = await Future.wait([
        storiesUsecase.call(NoParams()),
        feedsUsecase.call(NoParams()),
        communityUsecase.call(NoParams()),
      ]);

      final storiesResult = results[0] as Either<Failure, StoriesEntity>;
      final feedsResult = results[1] as Either<Failure, FeedsEntity>;
      final communitiesResult =
          results[2] as Either<Failure, CommunitiesEntity>;

      final failure = [
        storiesResult,
        feedsResult,
        communitiesResult,
      ].whereType<Left>().cast<Left<Failure, dynamic>>().firstOrNull;

      if (failure != null) {
        emit(HomeErrorState(message: failure.value.message));
        return;
      }

      emit(
        HomeLoadedState(
          communities: communitiesResult
              .getOrElse(() => const CommunitiesEntity(communities: []))
              .communities,
          feeds: feedsResult
              .getOrElse(() => const FeedsEntity(feeds: []))
              .feeds,
          stories: storiesResult
              .getOrElse(() => const StoriesEntity(stories: []))
              .stories,
        ),
      );
    } on Exception catch (e) {
      emit(HomeErrorState(message: e.toString()));
    }
  }
}
