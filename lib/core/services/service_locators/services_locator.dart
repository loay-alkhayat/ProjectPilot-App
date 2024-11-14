import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projectpilot/core/services/service_locators/auth_service_locator.dart';
import 'package:projectpilot/core/services/service_locators/posts_service_locator.dart';
import 'package:projectpilot/core/services/service_locators/requests_service_locator.dart';
import 'package:projectpilot/core/services/service_locators/student_service_locator.dart';
import 'package:projectpilot/core/services/service_locators/tasks_service_locator.dart';
import 'package:projectpilot/core/services/service_locators/teams_service_locator.dart';
import 'package:projectpilot/student/data/datasources/add_bio_data_source/add_bio_data_source.dart';
import 'package:projectpilot/student/data/datasources/add_bio_data_source/add_bio_data_source_imp.dart';
import 'package:projectpilot/student/data/datasources/get_blog_data_source/get_blog_data_source.dart';
import 'package:projectpilot/student/data/datasources/get_blog_data_source/get_blog_data_source_imp.dart';
import 'package:projectpilot/student/data/datasources/get_engineer_data_source/get_engineer_data_source.dart';
import 'package:projectpilot/student/data/datasources/get_engineer_data_source/get_engineer_data_source_imp.dart';
import 'package:projectpilot/student/data/datasources/get_proposals_data_source/get_proposals_data_source.dart';
import 'package:projectpilot/student/data/datasources/get_proposals_data_source/get_proposals_data_source_imp.dart';
import 'package:projectpilot/student/data/datasources/get_supervisors_data_source/get_supervisors_data_source_imp.dart';
import 'package:projectpilot/student/data/repositories/add_bio_repository_imp.dart';
import 'package:projectpilot/student/data/repositories/blogs_repo_imp/get_blogs_repo_imp.dart';
import 'package:projectpilot/student/data/repositories/get_proposals_repo_imp.dart';
import 'package:projectpilot/student/data/repositories/get_supervisors_repository_imp.dart';
import 'package:projectpilot/student/domain/repositories/blogs_repos/get_blos_repos.dart';
import 'package:projectpilot/student/domain/repositories/student_repos/add_bio_repository.dart';
import 'package:projectpilot/student/domain/repositories/supervisors_repos/get_engineer_repository.dart';
import 'package:projectpilot/student/domain/repositories/supervisors_repos/get_supervisor_repository.dart';
import 'package:projectpilot/student/domain/repositories/team_repos/get_proposals_repo.dart';
import 'package:projectpilot/student/domain/usecases/blogs_usecase/get_blog_usecase.dart';
import 'package:projectpilot/student/domain/usecases/student_usecases/add_bio_usecase.dart';
import 'package:projectpilot/student/domain/usecases/supervisors_usecases/get_engineer_usecase.dart';
import 'package:projectpilot/student/domain/usecases/supervisors_usecases/get_supervisors_usecase.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/cubit.dart';
import 'package:projectpilot/student/presentation/layouts/student_screens/bio_cubit/bio_cubit.dart';

import '../../../student/data/datasources/get_supervisors_data_source/get_supervisors_data_source.dart';
import '../../../student/data/repositories/get_engineer_repository_imp.dart';
import '../../../student/domain/usecases/team_usecases/get_proposals_usecase.dart';

final sl = GetIt.instance;

class ServicesLocator {
  static ServicesLocator? _instance;

  ServicesLocator._();

  factory ServicesLocator() => _instance ??= ServicesLocator._();

  void init() {
    sl.registerFactory<TextEditingController>(() => TextEditingController());

    AuthServicesLocator.init();
    TasksServicesLocator.init();
    TeamsServicesLocator.init();
    RequestsServicesLocator.init();
    PostsServicesLocator.init();
    StudentServicesLocator.init();

    /// Bloc
    sl.registerFactory(() => BioCubit(sl()));
    sl.registerFactory(() => MainCubit(
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
        ));

    /// Use Cases
    sl.registerLazySingleton(() => SupervisorsUseCase(sl()));
    sl.registerLazySingleton(() => EngineersUseCase(sl()));
    sl.registerLazySingleton(() => GetProposalsUseCase(sl()));
    sl.registerLazySingleton(() => AddBioUseCase(sl()));
    sl.registerLazySingleton(() => GetBlogsUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<SupervisorRepository>(
        () => SupervisorsRepositoryImp(sl()));
    sl.registerLazySingleton<EngineerRepository>(
        () => EngineersRepositoryImp(sl()));
    sl.registerLazySingleton<BioRepository>(() => BioRepositoryImp(sl()));

    sl.registerLazySingleton<GetProposalsRepository>(
        () => GetProposalsRepositoryImp(sl()));
    sl.registerLazySingleton<GetBlogsRepository>(
        () => GetBlogsRepositoryImp(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<SupervisorDataSource>(
        () => SupervisorDataSourceImp());
    sl.registerLazySingleton<BioDataSource>(() => BioDataSourceImp());
    sl.registerLazySingleton<EngineerDataSource>(() => EngineerDataSourceImp());

    sl.registerLazySingleton<GetProposalsDataSource>(
        () => GetProposalsDataSourceImp());
    sl.registerLazySingleton<GetBlogsDataSource>(() => GetBlogsDataSourceImp());
  }
}
