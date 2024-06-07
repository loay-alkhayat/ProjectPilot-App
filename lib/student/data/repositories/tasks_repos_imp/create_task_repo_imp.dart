import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/data/models/task_models/create_task_model.dart';
import 'package:projectpilot/student/domain/parameters/tasks_params/create_task_parameters.dart';
import 'package:projectpilot/student/domain/repositories/task_repos/create_task_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/services/dio_services.dart';
import '../../datasources/task_data_sources/create_task_data_source/create_task_data_source.dart';

class CreateTaskRepositoryImp implements CreateTaskRepository {
  final CreateTaskDataSuorce createTaskDataSuorce;

  CreateTaskRepositoryImp(this.createTaskDataSuorce);

  @override
  Future<Either<Failure, CreateTaskModel>> createTask(
      CreateTaskParameters parameters) async {
    try {
      final result = await createTaskDataSuorce.createTask(parameters);
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
