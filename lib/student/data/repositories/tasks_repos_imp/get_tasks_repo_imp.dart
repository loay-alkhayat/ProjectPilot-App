import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/parameters/tasks_params/get_tasks_param.dart';

import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/services/dio_services.dart';
import '../../../domain/repositories/task_repos/get_tasks_repo.dart';
import '../../datasources/task_data_sources/get_tasks_data_source/get_tasks_data_source.dart';
import '../../models/task_models/get_tasks_model.dart';

class GetTasksRepositoryImp implements GetTasksRepository {
  final GetTasksDataSource getTasksDataSource;

  GetTasksRepositoryImp(this.getTasksDataSource);

  @override
  Future<Either<Failure, GetTasksModel>> getTasks(
      GetTaskParameters parameters) async {
    try {
      final result = await getTasksDataSource.getTasks(parameters);

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
