import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/services/dio_services.dart';
import '../../../domain/parameters/tasks_params/delete_task_param.dart';
import '../../../domain/repositories/task_repos/delete_task_repo.dart';
import '../../datasources/task_data_sources/delete_task_data_source/delete_task_data_source.dart';
import '../../models/task_models/delete_task_model.dart';

class DeleteTaskRepositoryImp implements DeleteTaskRepository {
  final DeleteTaskDataSource deleteTaskDataSource;

  DeleteTaskRepositoryImp(this.deleteTaskDataSource);

  @override
  Future<Either<Failure, DeleteTaskModel>> deleteTask(
      DeleteTaskParameters parameters) async {
    try {
      final result = await deleteTaskDataSource.deleteTask(parameters);
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
