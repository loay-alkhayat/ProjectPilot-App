import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../entities/blogs_entity/get_blogs_entity.dart';

abstract class GetBlogsRepository {
  Future<Either<Failure, GetBlogsEntity>> getBlogs();
}
