import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/parameters/posts_params/add_like_param.dart';

import '../../../../core/errors/failures.dart';
import '../../entities/post_entities/add_comment_entity.dart';

abstract class AddLikeRepository {
  Future<Either<Failure, PostMethodResponsePostsScreensEntity>> addLike(
      AddLikeParameters parameters);
}
