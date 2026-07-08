import 'package:cness_test/core/exceptions/failure.dart';
import 'package:cness_test/core/shared/domain/usecases/no_params.dart';
import 'package:cness_test/core/shared/domain/usecases/usecase.dart';
import 'package:cness_test/features/home/domain/entities/story_entity.dart';
import 'package:cness_test/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetStoriesUsecase implements UseCase<StoriesEntity, NoParams> {
  final HomeRepository repository;

  GetStoriesUsecase(this.repository);

  @override
  Future<Either<Failure, StoriesEntity>> call(NoParams params) async {
    return await repository.getStories();
  }
}
