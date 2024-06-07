import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/data/models/invitation_models/send_join_request_model.dart';
import 'package:projectpilot/student/domain/parameters/send_join_request_param.dart';
import 'package:projectpilot/student/domain/repositories/invitation_repos/send_join_request_repo.dart';

import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/services/dio_services.dart';
import '../../datasources/invitations_data_source/send_join_request_data_source/send_join_request_data_source.dart';

class SendJoinRequestRepositoryImp implements SendJoinRequestRepository {
  final SendJoinRequestDataSource sendJoinRequestDataSource;

  SendJoinRequestRepositoryImp(this.sendJoinRequestDataSource);

  @override
  Future<Either<Failure, SendJoinRequestModel>> sendJoinRequest(
      SendJoinRequestParameters parameters) async {
    try {
      final result =
          await sendJoinRequestDataSource.sendJoinRequest(parameters);
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
