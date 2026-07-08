part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String message;

  const HomeErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class HomeLoadedState extends HomeState {
  final List<CommunityEntity> communities;
  final List<FeedEntity> feeds;
  final List<StoryEntity> stories;

  const HomeLoadedState({
    required this.communities,
    required this.feeds,
    required this.stories,
  });

  HomeLoadedState copyWith({
    List<CommunityEntity>? communities,
    List<FeedEntity>? feeds,
    List<StoryEntity>? stories,
  }) {
    return HomeLoadedState(
      communities: communities ?? this.communities,
      feeds: feeds ?? this.feeds,
      stories: stories ?? this.stories,
    );
  }

  @override
  List<Object> get props => [communities, feeds, stories];
}
