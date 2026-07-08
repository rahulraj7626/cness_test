import 'package:cness_test/core/exceptions/failure.dart';
import 'package:cness_test/features/profile/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserEntity>> getProfile();
}
