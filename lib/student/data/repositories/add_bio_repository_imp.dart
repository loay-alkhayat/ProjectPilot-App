import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/data/datasources/add_bio_data_source/add_bio_data_source.dart';
import 'package:projectpilot/student/data/models/student_models/bio_model.dart';
import 'package:projectpilot/student/domain/parameters/add_bio_parameters.dart';
import 'package:projectpilot/student/domain/repositories/student_repos/add_bio_repository.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/services/dio_services.dart';

class BioRepositoryImp implements BioRepository {
  final BioDataSource bioDataSource;

  BioRepositoryImp(this.bioDataSource);

  @override
  Future<Either<Failure, BioModel>> addBio(BioParameters parameters) async {
    try {
      final result = await bioDataSource.addBio(parameters);

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
