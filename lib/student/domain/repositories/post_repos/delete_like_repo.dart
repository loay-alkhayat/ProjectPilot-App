import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../entities/post_entities/add_comment_entity.dart';
import '../../parameters/posts_params/delete_like_param.dart';

abstract class DeleteLikeRepository {
  Future<Either<Failure, PostMethodResponsePostsScreensEntity>> deleteLike(
      UnLikeParameters parameters);
}
