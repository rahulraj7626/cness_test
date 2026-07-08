import 'package:cness_test/core/exceptions/failure.dart';
import 'package:cness_test/core/shared/domain/usecases/no_params.dart';
import 'package:cness_test/core/shared/domain/usecases/usecase.dart';
import 'package:cness_test/features/profile/domain/entities/user_entity.dart';
import 'package:cness_test/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class ProfileUsecase implements UseCase<UserEntity, NoParams> {
  final ProfileRepository repository;

  ProfileUsecase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await repository.getProfile();
  }
}
