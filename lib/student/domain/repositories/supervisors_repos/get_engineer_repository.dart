import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/entities/supervisors_entities/get_engineer_entity.dart';

import '../../../../../../core/errors/failures.dart';
import '../../parameters/search_engineers_param.dart';

abstract class EngineerRepository {
  Future<Either<Failure, EngineerEntity>> getEngineers(
      SearchEngineersParameters parameters);
}
