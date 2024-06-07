import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/data/models/team_models/create_team_model.dart';
import 'package:projectpilot/student/domain/parameters/create_team_param.dart';
import 'package:projectpilot/student/domain/repositories/team_repos/create_team_repository.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/services/dio_services.dart';
import '../datasources/team_data_sources/creat_team_data_source/creat_team_data_source.dart';

class CreateTeamRepositoryImp implements CreatTeamRepository {
  final CreateTeamDataSource createTeamDataSource;

  CreateTeamRepositoryImp(this.createTeamDataSource);

  @override
  Future<Either<Failure, CreateTeamModel>> createTeam(
      CreateTeamParameters parameters) async {
    try {
      final result = await createTeamDataSource.createTeam(parameters);
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
