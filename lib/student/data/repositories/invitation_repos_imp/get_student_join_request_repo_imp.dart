import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/services/dio_services.dart';
import '../../../domain/repositories/invitation_repos/get_student_join_request_repo.dart';
import '../../datasources/invitations_data_source/get_student_join_request_data_source/get_student_join_request_data_source.dart';
import '../../models/invitation_models/get_student_join_request_model.dart';

class GetStudentJoinRequestRepositoryImp
    implements GetStudentJoinRequestRepository {
  final GetStudentJoinRequestDataSource getStudentJoinRequestDataSource;

  GetStudentJoinRequestRepositoryImp(this.getStudentJoinRequestDataSource);

  @override
  Future<Either<Failure, GetStudentJoinRequestModel>>
      getStudentJoinRequest() async {
    try {
      final result =
          await getStudentJoinRequestDataSource.getStudentJoinRequest();

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
