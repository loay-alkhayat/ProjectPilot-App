import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/entities/team_entities/create_team_entity.dart';
import 'package:projectpilot/student/domain/parameters/create_team_param.dart';

import '../../../../../../core/errors/failures.dart';

abstract class CreatTeamRepository {
  Future<Either<Failure, CreateTeamEntity>> createTeam(
      CreateTeamParameters parameters);
}
