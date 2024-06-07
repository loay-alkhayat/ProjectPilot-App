import 'package:dartz/dartz.dart';
import 'package:projectpilot/core/errors/failures.dart';
import 'package:projectpilot/core/usecase/base_usecase.dart';
import 'package:projectpilot/student/domain/parameters/posts_params/add_like_param.dart';
import 'package:projectpilot/student/domain/repositories/post_repos/add_like_repo.dart';

import '../../entities/post_entities/add_comment_entity.dart';

class AddLikeUseCase extends BaseUseCase<PostMethodResponsePostsScreensEntity,
    AddLikeParameters> {
  final AddLikeRepository addLikeRepository;

  AddLikeUseCase(this.addLikeRepository);

  @override
  Future<Either<Failure, PostMethodResponsePostsScreensEntity>> call(
      AddLikeParameters parameters) async {
    return await addLikeRepository.addLike(parameters);
  }
}
