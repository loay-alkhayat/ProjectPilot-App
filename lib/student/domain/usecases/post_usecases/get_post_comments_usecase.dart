import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/parameters/posts_params/get_post_comments_parameters.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/base_usecase.dart';
import '../../entities/post_entities/get_post_comments_entity.dart';
import '../../repositories/post_repos/get_post_comments_repo.dart';

class GetPostCommentsUseCase
    extends BaseUseCase<GetPostCommentsEntity, GetPostCommentsParameters> {
  final GetPostCommentsRepository getPostCommentsRepository;

  GetPostCommentsUseCase(this.getPostCommentsRepository);

  @override
  Future<Either<Failure, GetPostCommentsEntity>> call(parameters) async {
    return await getPostCommentsRepository.getPostComments(parameters);
  }
}
