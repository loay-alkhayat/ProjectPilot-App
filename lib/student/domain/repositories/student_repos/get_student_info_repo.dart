import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../entities/student_entities/get_student_profile_by_token_entity.dart';

abstract class GetStudentInfoRepository {
  Future<Either<Failure, GetStudentInfoEntity>> getStudentInfo();
}
