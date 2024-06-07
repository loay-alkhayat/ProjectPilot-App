import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/parameters/student_params/get_student_by_id_param.dart';

import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/services/dio_services.dart';
import '../../../domain/repositories/student_repos/get_student_by_id_repo.dart';
import '../../datasources/get_student_by_id_data_source/get_student_by_id_data_source.dart';
import '../../models/student_models/get_student_by_id_model.dart';

class GetStudentByIdRepositoryImp implements GetStudentByIdRepository {
  final GetStudentByIdDataSource getStudentByIdDataSource;

  GetStudentByIdRepositoryImp(this.getStudentByIdDataSource);

  @override
  Future<Either<Failure, GetStudentByIdModel>> getStudentById(
      GetStudentByIdParameters parameters) async {
    try {
      final result = await getStudentByIdDataSource.getStudentById(parameters);

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
