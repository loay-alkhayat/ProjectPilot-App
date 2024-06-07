import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/parameters/posts_params/get_post_comments_parameters.dart';

import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/services/dio_services.dart';
import '../../../domain/repositories/post_repos/get_post_comments_repo.dart';
import '../../datasources/posts_data_soucre/get_post_comments_data_source/get_post_comments_data_source.dart';
import '../../models/posts_models/get_post_comments_model.dart';

class GetPostCommentsRepositoryImp implements GetPostCommentsRepository {
  final GetPostCommentsDataSource getPostCommentsDataSource;

  GetPostCommentsRepositoryImp(this.getPostCommentsDataSource);

  @override
  Future<Either<Failure, GetPostCommentsModel>> getPostComments(
      GetPostCommentsParameters parameters) async {
    try {
      final result =
          await getPostCommentsDataSource.getPostComments(parameters);

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
