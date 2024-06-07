import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../entities/post_entities/add_comment_entity.dart';
import '../../parameters/posts_params/add_comment_param.dart';

abstract class AddCommentRepository {
  Future<Either<Failure, PostMethodResponsePostsScreensEntity>> addComment(
      AddCommentParameters parameters);
}
