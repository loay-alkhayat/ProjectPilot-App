import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/data/datasources/get_students_data_source/get_students_data_source.dart';
import 'package:projectpilot/student/data/models/student_models/get_students_model.dart';
import 'package:projectpilot/student/domain/parameters/search_students_param.dart';
import 'package:projectpilot/student/domain/repositories/student_repos/get_students_repo.dart';

import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/services/dio_services.dart';

class GetStudentsRepositoryImp implements GetStudentsRepository {
  final GetStudentsDataSource getStudentsDataSource;

  GetStudentsRepositoryImp(this.getStudentsDataSource);

  @override
  Future<Either<Failure, GetStudentsModel>> getStudents(
      SearchStudentsParameters parameters) async {
    try {
      final result = await getStudentsDataSource.getStudents(parameters);

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
