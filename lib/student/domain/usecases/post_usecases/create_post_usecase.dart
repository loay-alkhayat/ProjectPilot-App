import 'package:dartz/dartz.dart';
import 'package:projectpilot/core/errors/failures.dart';
import 'package:projectpilot/core/usecase/base_usecase.dart';
import 'package:projectpilot/student/domain/entities/Post_entities/creat_Post_entity.dart';

import '../../parameters/posts_params/create_post_param.dart';
import '../../repositories/post_repos/create_post_repo.dart';

class CreatePostUseCase
    extends BaseUseCase<CreatePostEntity, CreatePostParameters> {
  final CreatePostRepository createPostRepository;

  CreatePostUseCase(this.createPostRepository);

  @override
  Future<Either<Failure, CreatePostEntity>> call(
      CreatePostParameters parameters) async {
    return await createPostRepository.createPost(parameters);
  }
}
