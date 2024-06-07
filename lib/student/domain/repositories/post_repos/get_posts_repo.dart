import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../entities/post_entities/get_posts_entity.dart';

abstract class GetPostsRepository {
  Future<Either<Failure, GetPostsEntity>> getPosts();
}
