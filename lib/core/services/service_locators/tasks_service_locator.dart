import 'package:get_it/get_it.dart';
import 'package:projectpilot/student/data/datasources/task_data_sources/complete_sub_task_data_source/complete_sub_task_data_source.dart';
import 'package:projectpilot/student/data/datasources/task_data_sources/delete_sub_task_data_source/delete_sub_task_data_source.dart';
import 'package:projectpilot/student/data/repositories/tasks_repos_imp/complete_sub_task_repo_imp.dart';
import 'package:projectpilot/student/data/repositories/tasks_repos_imp/delete_sub_task_repo_imp.dart';
import 'package:projectpilot/student/domain/repositories/task_repos/complete_sub_task_repo.dart';
import 'package:projectpilot/student/domain/repositories/task_repos/delete_sub_task_repo.dart';
import 'package:projectpilot/student/domain/usecases/task_usecases/complete_sub_task_usecase.dart';
import 'package:projectpilot/student/domain/usecases/task_usecases/delete_sub_task_usecase.dart';
import 'package:projectpilot/student/domain/usecases/task_usecases/get_student_tasks_usecase.dart';
import 'package:projectpilot/student/domain/usecases/task_usecases/get_task_by_id_usecase.dart';

import '../../../student/data/datasources/task_data_sources/complete_sub_task_data_source/complete_sub_task_data_source_imp.dart';
import '../../../student/data/datasources/task_data_sources/create_sub_task_data_source/create_sub_task_data_source.dart';
import '../../../student/data/datasources/task_data_sources/create_sub_task_data_source/create_sub_task_data_source_imp.dart';
import '../../../student/data/datasources/task_data_sources/create_task_data_source/create_task_data_source.dart';
import '../../../student/data/datasources/task_data_sources/create_task_data_source/create_task_data_source_imp.dart';
import '../../../student/data/datasources/task_data_sources/delete_sub_task_data_source/delete_sub_task_data_source_imp.dart';
import '../../../student/data/datasources/task_data_sources/delete_task_data_source/delete_task_data_source.dart';
import '../../../student/data/datasources/task_data_sources/delete_task_data_source/delete_task_data_source_imp.dart';
import '../../../student/data/datasources/task_data_sources/get_student_tasks_data_source/get_student_tasks_data_source.dart';
import '../../../student/data/datasources/task_data_sources/get_student_tasks_data_source/get_student_tasks_data_source_imp.dart';
import '../../../student/data/datasources/task_data_sources/get_task_by_id_data_source/get_task_by_id_data_source.dart';
import '../../../student/data/datasources/task_data_sources/get_task_by_id_data_source/get_task_by_id_data_source_imp.dart';
import '../../../student/data/datasources/task_data_sources/get_tasks_data_source/get_tasks_data_source.dart';
import '../../../student/data/datasources/task_data_sources/get_tasks_data_source/get_tasks_data_source_imp.dart';
import '../../../student/data/repositories/tasks_repos_imp/create_sub_task_repo_imp.dart';
import '../../../student/data/repositories/tasks_repos_imp/create_task_repo_imp.dart';
import '../../../student/data/repositories/tasks_repos_imp/delete_task_repo_imp.dart';
import '../../../student/data/repositories/tasks_repos_imp/get_student_tasks_repo_imp.dart';
import '../../../student/data/repositories/tasks_repos_imp/get_task_by_id_repo_imp.dart';
import '../../../student/data/repositories/tasks_repos_imp/get_tasks_repo_imp.dart';
import '../../../student/domain/repositories/task_repos/create_sub_task_repo.dart';
import '../../../student/domain/repositories/task_repos/create_task_repo.dart';
import '../../../student/domain/repositories/task_repos/delete_task_repo.dart';
import '../../../student/domain/repositories/task_repos/get_student_tasks_repo.dart';
import '../../../student/domain/repositories/task_repos/get_task_by_id_repo.dart';
import '../../../student/domain/repositories/task_repos/get_tasks_repo.dart';
import '../../../student/domain/usecases/task_usecases/create_sub_task_usecase.dart';
import '../../../student/domain/usecases/task_usecases/create_task_usecase.dart';
import '../../../student/domain/usecases/task_usecases/delete_task_usecase.dart';
import '../../../student/domain/usecases/task_usecases/get_tasks_usecase.dart';

final sl = GetIt.instance;

class TasksServicesLocator {
  static TasksServicesLocator? _instance;

  TasksServicesLocator._();

  factory TasksServicesLocator() => _instance ??= TasksServicesLocator._();

  static void init() {
    /// Bloc

    /// Use Cases

    sl.registerLazySingleton(() => GetTasksUseCase(sl()));
    sl.registerLazySingleton(() => CreateTaskUseCase(sl()));
    sl.registerLazySingleton(() => CreateSubTaskUseCase(sl()));
    sl.registerLazySingleton(() => DeleteTaskUseCase(sl()));
    sl.registerLazySingleton(() => GetStudentTasksUseCase(sl()));
    sl.registerLazySingleton(() => CompleteSubTaskUseCase(sl()));
    sl.registerLazySingleton(() => DeleteSubTaskUseCase(sl()));
    sl.registerLazySingleton(() => GetTaskByIdUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<GetTasksRepository>(
        () => GetTasksRepositoryImp(sl()));
    sl.registerLazySingleton<CreateTaskRepository>(
        () => CreateTaskRepositoryImp(sl()));
    sl.registerLazySingleton<CreateSubTaskRepository>(
        () => CreateSubTaskRepositoryImp(sl()));
    sl.registerLazySingleton<DeleteTaskRepository>(
        () => DeleteTaskRepositoryImp(sl()));
    sl.registerLazySingleton<GetStudentTasksRepository>(
        () => GetStudentTasksRepositoryImp(sl()));
    sl.registerLazySingleton<CompleteSubTaskRepository>(
        () => CompleteSubTaskRepositoryImp(sl()));
    sl.registerLazySingleton<DeleteSubTaskRepository>(
        () => DeleteSubTaskRepositoryImp(sl()));
    sl.registerLazySingleton<GetTaskByIdRepository>(
        () => GetTaskByIdRepositoryImp(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<GetTasksDataSource>(() => GetTasksDataSourceImp());
    sl.registerLazySingleton<CreateTaskDataSuorce>(
        () => CreateTaskDataSourceImp());
    sl.registerLazySingleton<CreateSubTaskDataSuorce>(
        () => CreateSubTaskDataSourceImp());
    sl.registerLazySingleton<DeleteTaskDataSource>(
        () => DeleteTaskDataSourceImp());
    sl.registerLazySingleton<GetStudentTasksDataSource>(
        () => GetStudentTasksDataSourceImp());
    sl.registerLazySingleton<CompleteSubTaskDataSuorce>(
        () => CompleteSubTaskDataSourceImp());
    sl.registerLazySingleton<DeleteSubTaskDataSuorce>(
        () => DeleteSubTaskDataSourceImp());
    sl.registerLazySingleton<GetTaskByIdDataSource>(
        () => GetTaskByIdDataSourceImp());
  }
}
