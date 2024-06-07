import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/base_usecase.dart';
import '../../entities/post_entities/get_posts_entity.dart';
import '../../repositories/post_repos/get_posts_repo.dart';

class GetPostsUseCase extends BaseUseCase<GetPostsEntity, NoParameters> {
  final GetPostsRepository getPostsRepository;

  GetPostsUseCase(this.getPostsRepository);

  @override
  Future<Either<Failure, GetPostsEntity>> call(parameters) async {
    return await getPostsRepository.getPosts();
  }
}
