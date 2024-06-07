import 'package:dartz/dartz.dart';
import 'package:projectpilot/core/usecase/base_usecase.dart';

import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/services/dio_services.dart';
import '../../../domain/repositories/task_repos/get_student_tasks_repo.dart';
import '../../datasources/task_data_sources/get_student_tasks_data_source/get_student_tasks_data_source.dart';
import '../../models/task_models/get_student_tasks_model.dart';

class GetStudentTasksRepositoryImp implements GetStudentTasksRepository {
  final GetStudentTasksDataSource getStudentTasksDataSource;

  GetStudentTasksRepositoryImp(this.getStudentTasksDataSource);

  @override
  Future<Either<Failure, GetStudentTasksModel>> getStudentTasks(
      NoParameters parameters) async {
    try {
      final result =
          await getStudentTasksDataSource.getStudentTasks(parameters);

      return Right(result);
    } catch (e) {
      logger.d(
          "================== in handleEither Exception ====================== \n ${e.runtimeType} \n ${e.toString()}");
      if (e is UnAuthorizedException) {
        return Left(UnAuthorizedFailure(e.message));
      }
      if (e is ServerException) {
        return Left(ServerFailure(e.errorMessageModel.statusMessage));
      }
      if (e is MethodNotAllowedExepction) {
        return Left(MethodNotAllowedFailure(e.message));
      }
      if (e is ForbiddenException) {
        return Left(ForbiddenFailure(e.message));
      }
      if (e is NotFoundException) {
        return Left(NotFoundFailure(e.message));
      }
      if (e is InternalServerErrorException) {
        return Left(InternalServerErrorFailure(e.message));
      }
      if (e is NoInternetConnectionException) {
        return Left(NoInternetConnectionFailure(e.message));
      }
      if (e is ParsingException) {
        return Left(ParsingFailure(e.message));
      }
      if (e is UnknownException) {
        return Left(UnknownFailure(e.message));
      }
      return Left(Failure(e.toString()));
    }
  }
}
