import 'package:cness_test/core/exceptions/failure.dart';
import 'package:dartz/dartz.dart';

///Base usecase
abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}
