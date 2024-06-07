import 'package:get_it/get_it.dart';
import 'package:projectpilot/student/data/datasources/get_student_info_data_source/get_student_info_data_source.dart';
import 'package:projectpilot/student/data/datasources/get_student_info_data_source/get_student_info_data_source_imp.dart';
import 'package:projectpilot/student/data/repositories/student_repos_imp/get_student_info_repo_imp.dart';
import 'package:projectpilot/student/domain/repositories/student_repos/get_student_info_repo.dart';
import 'package:projectpilot/student/domain/usecases/student_usecases/get_student_info_usecase.dart';

import '../../../student/data/datasources/get_student_by_id_data_source/get_student_by_id_data_source.dart';
import '../../../student/data/datasources/get_student_by_id_data_source/get_student_by_id_data_source_imp.dart';
import '../../../student/data/datasources/get_students_data_source/get_students_data_source.dart';
import '../../../student/data/datasources/get_students_data_source/get_students_data_source_imp.dart';
import '../../../student/data/repositories/student_repos_imp/get_student_by_id_repo_imp.dart';
import '../../../student/data/repositories/student_repos_imp/get_students_repo_imp.dart';
import '../../../student/domain/repositories/student_repos/get_student_by_id_repo.dart';
import '../../../student/domain/repositories/student_repos/get_students_repo.dart';
import '../../../student/domain/usecases/student_usecases/get_student_by_id_usecase.dart';
import '../../../student/domain/usecases/student_usecases/get_students_usecase.dart';

final sl = GetIt.instance;

class StudentServicesLocator {
  static StudentServicesLocator? _instance;

  StudentServicesLocator._();

  factory StudentServicesLocator() => _instance ??= StudentServicesLocator._();

  static void init() {
    /// Use Cases
    sl.registerLazySingleton(() => GetStudentByIdUseCase(sl()));
    sl.registerLazySingleton(() => GetStudentsUseCase(sl()));

    sl.registerLazySingleton(() => GetStudentInfoUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<GetStudentInfoRepository>(
        () => GetStudentInfoRepositoryImp(sl()));
    sl.registerLazySingleton<GetStudentByIdRepository>(
        () => GetStudentByIdRepositoryImp(sl()));
    sl.registerLazySingleton<GetStudentsRepository>(
        () => GetStudentsRepositoryImp(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<GetStudentByIdDataSource>(
        () => GetStudentByIdDataSourceImp());
    sl.registerLazySingleton<GetStudentsDataSource>(
        () => GetStudentsDataSourceImp());
    sl.registerLazySingleton<GetStudentInfoDataSource>(
        () => GetStudentInfoDataSourceImp());
  }
}
