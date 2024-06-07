import 'package:dartz/dartz.dart';
import 'package:projectpilot/core/errors/failures.dart';
import 'package:projectpilot/core/usecase/base_usecase.dart';

import '../../entities/post_entities/add_comment_entity.dart';
import '../../parameters/posts_params/add_comment_param.dart';
import '../../repositories/post_repos/add_comment_repo.dart';

class AddCommentUseCase extends BaseUseCase<
    PostMethodResponsePostsScreensEntity, AddCommentParameters> {
  final AddCommentRepository addCommentRepository;

  AddCommentUseCase(this.addCommentRepository);

  @override
  Future<Either<Failure, PostMethodResponsePostsScreensEntity>> call(
      AddCommentParameters parameters) async {
    return await addCommentRepository.addComment(parameters);
  }
}
