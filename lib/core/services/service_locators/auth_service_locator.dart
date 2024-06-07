import 'package:get_it/get_it.dart';
import 'package:projectpilot/student/data/datasources/auth_data_source/logout_data_source/logout_data_source.dart';
import 'package:projectpilot/student/data/datasources/auth_data_source/logout_data_source/logout_data_source_imp.dart';
import 'package:projectpilot/student/domain/repositories/auth_repos/logout_repo.dart';
import 'package:projectpilot/student/domain/usecases/auth_usecase/logout_usecase.dart';

import '../../../student/data/datasources/auth_data_source/login_data_source/auth_data_source.dart';
import '../../../student/data/datasources/auth_data_source/login_data_source/auth_data_source_imp.dart';
import '../../../student/data/repositories/auth_repository_imp.dart';
import '../../../student/data/repositories/logout_repo_imp.dart';
import '../../../student/domain/repositories/auth_repos/auth_repository.dart';
import '../../../student/domain/usecases/auth_usecase/login_usecase.dart';
import '../../../student/presentation/blocs/login/login_cubit.dart';

final sl = GetIt.instance;

class AuthServicesLocator {
  static AuthServicesLocator? _instance;

  AuthServicesLocator._();

  factory AuthServicesLocator() => _instance ??= AuthServicesLocator._();

  static void init() {
    /// Bloc

    sl.registerFactory(() => LoginCubit(sl(), sl()));

    /// Use Cases

    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => LogoutUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImp(sl()));
    sl.registerLazySingleton<LogoutRepository>(() => LogoutRepositoryImp(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImp());
    sl.registerLazySingleton<LogoutDataSource>(() => LogoutDataSourceImp());
  }
}
