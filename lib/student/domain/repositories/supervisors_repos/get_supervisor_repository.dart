import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/entities/supervisors_entities/get_supervisor_entity.dart';
import 'package:projectpilot/student/domain/parameters/search_supervisors_param.dart';

import '../../../../../../core/errors/failures.dart';

abstract class SupervisorRepository {
  Future<Either<Failure, SupervisorEntity>> getSupervisors(
      SearchSupervisorsParameters parameters);
}
