import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/services/dio_services.dart';
import '../../../domain/repositories/invitation_repos/get_team_join_requests.dart';
import '../../datasources/invitations_data_source/get_team_join_requests_data_source/get_team_join_requests_data_source.dart';
import '../../models/invitation_models/get_team_join_requests_model.dart';

class GetTeamJoinRequestRepositoryImp implements GetTeamJoinRequestRepository {
  final GetTeamJoinRequestDataSource getTeamJoinRequestDataSource;

  GetTeamJoinRequestRepositoryImp(this.getTeamJoinRequestDataSource);

  @override
  Future<Either<Failure, GetTeamJoinRequestModel>> getTeamJoinRequest() async {
    try {
      final result = await getTeamJoinRequestDataSource.getTeamJoinRequest();

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
