import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../entities/team_entities/get_team_by_id_entity.dart';
import '../../parameters/get_team_by_id_param.dart';

abstract class GetTeamByIdRepository {
  Future<Either<Failure, GetTeamByIdEntity>> getTeamById(
      GetTeamByIdParameters parameters);
}
