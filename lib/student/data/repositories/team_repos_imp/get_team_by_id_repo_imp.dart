import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/services/dio_services.dart';
import '../../../domain/parameters/get_team_by_id_param.dart';
import '../../../domain/repositories/team_repos/get_team_by_id_repo.dart';
import '../../datasources/team_data_sources/get_team_by_id_data_source/get_team_by_id_data_source.dart';
import '../../models/team_models/get_team_by_id_model.dart';

class GetTeamByIdRepositoryImp implements GetTeamByIdRepository {
  final GetTeamByIdDataSource getTeamByIdDataSuorce;

  GetTeamByIdRepositoryImp(this.getTeamByIdDataSuorce);

  @override
  Future<Either<Failure, GetTeamByIdModel>> getTeamById(
      GetTeamByIdParameters parameters) async {
    try {
      final result = await getTeamByIdDataSuorce.getTeamById(parameters);
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
