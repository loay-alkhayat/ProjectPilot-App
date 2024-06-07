import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/services/dio_services.dart';
import '../../../domain/parameters/posts_params/add_comment_param.dart';
import '../../../domain/repositories/post_repos/add_comment_repo.dart';
import '../../datasources/add_comment_data_source/add_comment_data_source.dart';
import '../../models/posts_models/add_comment_model.dart';

class AddCommentRepositoryImp implements AddCommentRepository {
  final AddCommentDataSource addCommentDataSource;

  AddCommentRepositoryImp(this.addCommentDataSource);

  @override
  Future<Either<Failure, AddCommentOrLikeModel>> addComment(
      AddCommentParameters parameters) async {
    try {
      final result = await addCommentDataSource.addComment(parameters);
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
