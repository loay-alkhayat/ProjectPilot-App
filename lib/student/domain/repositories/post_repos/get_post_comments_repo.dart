import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/parameters/posts_params/get_post_comments_parameters.dart';

import '../../../../../../core/errors/failures.dart';
import '../../entities/post_entities/get_post_comments_entity.dart';

abstract class GetPostCommentsRepository {
  Future<Either<Failure, GetPostCommentsEntity>> getPostComments(
      GetPostCommentsParameters parameters);
}
