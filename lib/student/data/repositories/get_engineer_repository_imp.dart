import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/data/datasources/get_engineer_data_source/get_engineer_data_source.dart';
import 'package:projectpilot/student/data/models/supervisors_models/engineer_model.dart';
import 'package:projectpilot/student/domain/repositories/supervisors_repos/get_engineer_repository.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/services/dio_services.dart';
import '../../domain/parameters/search_engineers_param.dart';

class EngineersRepositoryImp implements EngineerRepository {
  final EngineerDataSource engineerDataSource;

  EngineersRepositoryImp(this.engineerDataSource);

  @override
  Future<Either<Failure, EngineerModel>> getEngineers(
      SearchEngineersParameters parameters) async {
    try {
      final result = await engineerDataSource.getEngineers(parameters);

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
