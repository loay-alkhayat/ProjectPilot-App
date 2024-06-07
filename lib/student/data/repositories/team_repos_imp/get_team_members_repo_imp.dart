import 'package:dartz/dartz.dart';
import 'package:projectpilot/core/errors/exceptions.dart';
import 'package:projectpilot/core/errors/failures.dart';
import 'package:projectpilot/core/services/dio_services.dart';
import 'package:projectpilot/core/usecase/base_usecase.dart';
import 'package:projectpilot/student/data/datasources/team_data_sources/get_team_members_data_source/get_team_members_data_source.dart';
import 'package:projectpilot/student/data/models/team_models/get_team_members_model.dart';
import 'package:projectpilot/student/domain/repositories/team_repos/get_team_members_repo.dart';

class GetTeamMembersRepositoryImp implements GetTeamMembersRepository {
  final GetTeamMembersDataSource getTeamMembersDataSuorce;

  GetTeamMembersRepositoryImp(this.getTeamMembersDataSuorce);

  @override
  Future<Either<Failure, GetTeamMembersModel>> getTeamMembers(
      NoParameters parameters) async {
    try {
      final result = await getTeamMembersDataSuorce.getTeamMembers(parameters);
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
