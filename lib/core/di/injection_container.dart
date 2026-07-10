import 'package:cness_test/core/routes/app_router.dart';
import 'package:cness_test/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cness_test/features/home/data/datasources/home_datasource.dart';
import 'package:cness_test/features/home/data/datasources/home_datasource_impl.dart';
import 'package:cness_test/features/home/data/repositories/home_repository_impl.dart';
import 'package:cness_test/features/home/domain/repositories/home_repository.dart';
import 'package:cness_test/features/home/domain/usecases/get_communites_usecase.dart';
import 'package:cness_test/features/home/domain/usecases/get_feeds_usecase.dart';
import 'package:cness_test/features/home/domain/usecases/get_stories_usecase.dart';
import 'package:cness_test/features/home/presentation/bloc/home_bloc.dart';
import 'package:cness_test/features/profile/data/datasources/profile_datasource.dart';
import 'package:cness_test/features/profile/data/datasources/profile_datasource_impl.dart';
import 'package:cness_test/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:cness_test/features/profile/domain/repositories/profile_repository.dart';
import 'package:cness_test/features/profile/domain/usecases/profile_usecase.dart';
import 'package:cness_test/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:get_it/get_it.dart';

///Create instance of getit
final sl = GetIt.instance;

///Initialise all dependancy classess and blocs , repositories here
Future<void> init() async {
  /// Blocs
  sl.registerFactory(() => AuthBloc());

  sl.registerFactory(
    () => HomeBloc(
      storiesUsecase: sl<GetStoriesUsecase>(),
      feedsUsecase: sl<GetFeedsUsecase>(),
      communityUsecase: sl<GetCommunitesUsecase>(),
    ),
  );

  sl.registerFactory(() => ProfileBloc(profileUsecase: sl<ProfileUsecase>()));

  /// Use cases
  sl.registerLazySingleton(() => GetCommunitesUsecase(sl()));
  sl.registerLazySingleton(() => GetFeedsUsecase(sl()));
  sl.registerLazySingleton(() => GetStoriesUsecase(sl()));
  sl.registerLazySingleton(() => ProfileUsecase(sl()));

  /// Repositories
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(datasource: sl()),
  );
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(datasource: sl()),
  );

  /// Data sources
  sl.registerLazySingleton<HomeDataSource>(() => HomeDataSourceImpl());
  sl.registerLazySingleton<ProfileDatasource>(() => ProfileDatasourceImpl());

  /// Approuter
  sl.registerLazySingleton(() => AppRouter());
}
