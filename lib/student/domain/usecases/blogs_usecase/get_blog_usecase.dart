import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/base_usecase.dart';
import '../../entities/blogs_entity/get_blogs_entity.dart';
import '../../repositories/blogs_repos/get_blos_repos.dart';

class GetBlogsUseCase extends BaseUseCase<GetBlogsEntity, NoParameters> {
  final GetBlogsRepository getBlogsRepository;

  GetBlogsUseCase(this.getBlogsRepository);

  @override
  Future<Either<Failure, GetBlogsEntity>> call(parameters) async {
    return await getBlogsRepository.getBlogs();
  }
}
