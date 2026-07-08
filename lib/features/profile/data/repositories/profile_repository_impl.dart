import 'package:cness_test/core/exceptions/failure.dart';
import 'package:cness_test/features/profile/data/datasources/profile_datasource.dart';
import 'package:cness_test/features/profile/data/mappers/user_mappers.dart';
import 'package:cness_test/features/profile/domain/entities/user_entity.dart';
import 'package:cness_test/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDatasource datasource;

  ProfileRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, UserEntity>> getProfile() async {
    try {
      final userModel = await datasource.getProfile();
      return Right(userModel.toEntity());
    } on Exception catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
