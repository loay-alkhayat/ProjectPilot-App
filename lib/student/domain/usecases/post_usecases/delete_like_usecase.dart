import 'package:dartz/dartz.dart';
import 'package:projectpilot/core/errors/failures.dart';
import 'package:projectpilot/core/usecase/base_usecase.dart';

import '../../entities/post_entities/add_comment_entity.dart';
import '../../parameters/posts_params/delete_like_param.dart';
import '../../repositories/post_repos/delete_like_repo.dart';

class DeleteLikeUseCase extends BaseUseCase<
    PostMethodResponsePostsScreensEntity, UnLikeParameters> {
  final DeleteLikeRepository deleteLikeRepository;

  DeleteLikeUseCase(this.deleteLikeRepository);

  @override
  Future<Either<Failure, PostMethodResponsePostsScreensEntity>> call(
      UnLikeParameters parameters) async {
    return await deleteLikeRepository.deleteLike(parameters);
  }
}
