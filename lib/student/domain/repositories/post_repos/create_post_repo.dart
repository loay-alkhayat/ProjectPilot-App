import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/entities/Post_entities/creat_Post_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../parameters/posts_params/create_post_param.dart';

abstract class CreatePostRepository {
  Future<Either<Failure, CreatePostEntity>> createPost(
      CreatePostParameters parameters);
}
