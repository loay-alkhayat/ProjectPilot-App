import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/parameters/student_params/get_student_by_id_param.dart';

import '../../../../../../core/errors/failures.dart';
import '../../entities/student_entities/get_student_by_id_entity.dart';

abstract class GetStudentByIdRepository {
  Future<Either<Failure, GetStudentByIdEntity>> getStudentById(
      GetStudentByIdParameters parameters);
}
