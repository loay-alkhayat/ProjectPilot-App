import 'package:dartz/dartz.dart';
import 'package:projectpilot/core/errors/failures.dart';
import 'package:projectpilot/student/data/datasources/posts_data_soucre/delete_post_like_data_source/delete_post_like_data_source.dart';
import 'package:projectpilot/student/domain/entities/post_entities/add_comment_entity.dart';
import 'package:projectpilot/student/domain/parameters/posts_params/delete_like_param.dart';
import 'package:projectpilot/student/domain/repositories/post_repos/delete_like_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/dio_services.dart';

class DeleteLikeRepositoryImp implements DeleteLikeRepository {
  final DeletePostLikeDataSource deletePostLikeDataSource;

  DeleteLikeRepositoryImp(this.deletePostLikeDataSource);

  @override
  Future<Either<Failure, PostMethodResponsePostsScreensEntity>> deleteLike(
      UnLikeParameters parameters) async {
    try {
      final result = await deletePostLikeDataSource.deleteLike(parameters);
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
