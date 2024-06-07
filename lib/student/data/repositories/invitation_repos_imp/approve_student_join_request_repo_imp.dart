import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/services/dio_services.dart';
import '../../../domain/parameters/invitation_params/approve_student_join_request_param.dart';
import '../../../domain/repositories/invitation_repos/approve_student_join_request_repo.dart';
import '../../datasources/invitations_data_source/approve_student_join_request_data_source/approve_student_join_request_data_source.dart';
import '../../models/invitation_models/approve_and_reject_student_join_request_model.dart';

class ApproveStudentJoinRequestRepositoryImp
    implements ApproveStudentJoinRequestRepository {
  final ApproveStudentJoinRequestDataSource approveStudentJoinRequestDataSource;

  ApproveStudentJoinRequestRepositoryImp(
      this.approveStudentJoinRequestDataSource);

  @override
  Future<Either<Failure, AproveAndRejectStudentJoinRequestModel>>
      approveStudentJoinRequest(
          ApproveStudentJoinRequestParameters parameters) async {
    try {
      final result = await approveStudentJoinRequestDataSource
          .approveStudentJoinRequest(parameters);
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
