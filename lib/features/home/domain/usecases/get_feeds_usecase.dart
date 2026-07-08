import 'package:cness_test/core/exceptions/failure.dart';
import 'package:cness_test/core/shared/domain/usecases/no_params.dart';
import 'package:cness_test/core/shared/domain/usecases/usecase.dart';
import 'package:cness_test/features/home/domain/entities/feed_entity.dart';
import 'package:cness_test/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetFeedsUsecase implements UseCase<FeedsEntity, NoParams> {
  final HomeRepository repository;
  GetFeedsUsecase(this.repository);

  @override
  Future<Either<Failure, FeedsEntity>> call(NoParams params) async {
    return await repository.getFeeds();
  }
}
