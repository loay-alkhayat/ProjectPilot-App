import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/entities/student_entities/get_all_students_entity.dart';
import 'package:projectpilot/student/domain/parameters/search_students_param.dart';

import '../../../../../../core/errors/failures.dart';

abstract class GetStudentsRepository {
  Future<Either<Failure, GetStudentsEntity>> getStudents(
      SearchStudentsParameters parameters);
}
