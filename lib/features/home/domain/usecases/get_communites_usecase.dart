import 'package:cness_test/core/exceptions/failure.dart';
import 'package:cness_test/core/shared/domain/usecases/no_params.dart';
import 'package:cness_test/core/shared/domain/usecases/usecase.dart';
import 'package:cness_test/features/home/domain/entities/community_entity.dart';
import 'package:cness_test/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetCommunitesUsecase implements UseCase<CommunitiesEntity, NoParams> {
  final HomeRepository repository;

  GetCommunitesUsecase(this.repository);

  @override
  Future<Either<Failure, CommunitiesEntity>> call(NoParams params) async {
    return await repository.getCommunities();
  }
}
